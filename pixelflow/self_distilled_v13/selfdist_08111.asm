; DESCRIPTION: Renders a green rectangular region spanning 43 by 48 at (292, 178).
; PLAN: r0=292(x), r1=178(y), r2=43(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 178
LDI r2, 43
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
