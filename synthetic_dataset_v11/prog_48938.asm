; DESCRIPTION: Composite: . Then Renders a magenta box of size 85x62 starting at (82, 78). Then Places a purple line segment connecting (72, 69) to (27, 138).
; PLAN: r0=82(x), r1=78(y), r2=85(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=72(x1), r1=69(y1), r2=27(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta box of size 85x62 starting at (82, 78).
; PLAN: r0=82(x), r1=78(y), r2=85(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 78
LDI r2, 85
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple line segment connecting (72, 69) to (27, 138).
; PLAN: r0=72(x1), r1=69(y1), r2=27(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 69
LDI r2, 27
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
