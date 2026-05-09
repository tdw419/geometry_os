; DESCRIPTION: Draws a cyan circle centered at (161, 158) with radius 50.
; PLAN: r0=161(x), r1=158(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 158
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
