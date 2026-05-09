; DESCRIPTION: Draws a cyan circle centered at (152, 120) with radius 53.
; PLAN: r0=152(x), r1=120(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 120
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
