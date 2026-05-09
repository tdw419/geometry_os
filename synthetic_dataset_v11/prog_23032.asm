; DESCRIPTION: Draws a cyan circle centered at (158, 67) with radius 63.
; PLAN: r0=158(x), r1=67(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 67
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
