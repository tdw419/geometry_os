; DESCRIPTION: Composite: . Then Renders a magenta line between points (146, 22) and (190, 223). Then Draws a white rectangle at (101, 85) with width 79 and height 96.
; PLAN: r0=146(x1), r1=22(y1), r2=190(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=101(x), r1=85(y), r2=79(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta line between points (146, 22) and (190, 223).
; PLAN: r0=146(x1), r1=22(y1), r2=190(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 22
LDI r2, 190
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (101, 85) with width 79 and height 96.
; PLAN: r0=101(x), r1=85(y), r2=79(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 85
LDI r2, 79
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
