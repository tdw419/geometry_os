; DESCRIPTION: Renders a green rectangular region spanning 102 by 113 at (68, 66).
; PLAN: r0=68(x), r1=66(y), r2=102(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 66
LDI r2, 102
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
