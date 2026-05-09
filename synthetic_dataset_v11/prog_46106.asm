; DESCRIPTION: Composite: . Then Draws a red line from (149, 2) to (192, 182). Then Renders a blue box of size 85x10 starting at (132, 215).
; PLAN: r0=149(x1), r1=2(y1), r2=192(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=132(x), r1=215(y), r2=85(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red line from (149, 2) to (192, 182).
; PLAN: r0=149(x1), r1=2(y1), r2=192(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 2
LDI r2, 192
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 85x10 starting at (132, 215).
; PLAN: r0=132(x), r1=215(y), r2=85(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 215
LDI r2, 85
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
