; DESCRIPTION: Renders a green rectangular region spanning 58 by 119 at (271, 166).
; PLAN: r0=271(x), r1=166(y), r2=58(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 166
LDI r2, 58
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
