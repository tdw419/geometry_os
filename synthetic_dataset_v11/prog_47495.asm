; DESCRIPTION: Composite: . Then Draws a magenta line from (137, 124) to (243, 51). Then Renders a magenta box of size 52x117 starting at (86, 97).
; PLAN: r0=137(x1), r1=124(y1), r2=243(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=86(x), r1=97(y), r2=52(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta line from (137, 124) to (243, 51).
; PLAN: r0=137(x1), r1=124(y1), r2=243(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 124
LDI r2, 243
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 52x117 starting at (86, 97).
; PLAN: r0=86(x), r1=97(y), r2=52(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 97
LDI r2, 52
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
