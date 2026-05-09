; DESCRIPTION: Composite: . Then Renders a magenta box of size 74x10 starting at (176, 85). Then Places a red line segment connecting (202, 88) to (146, 183).
; PLAN: r0=176(x), r1=85(y), r2=74(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=202(x1), r1=88(y1), r2=146(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta box of size 74x10 starting at (176, 85).
; PLAN: r0=176(x), r1=85(y), r2=74(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 85
LDI r2, 74
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (202, 88) to (146, 183).
; PLAN: r0=202(x1), r1=88(y1), r2=146(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 88
LDI r2, 146
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
