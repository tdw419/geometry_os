; DESCRIPTION: Draws a cyan circle centered at (365, 186) with radius 53.
; PLAN: r0=365(x), r1=186(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 186
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
