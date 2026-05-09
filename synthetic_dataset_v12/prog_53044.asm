; DESCRIPTION: Draws a cyan circle centered at (46, 16) with radius 14.
; PLAN: r0=46(x), r1=16(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 16
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
