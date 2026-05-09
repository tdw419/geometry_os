; DESCRIPTION: Composite: . Then Renders a magenta box of size 36x94 starting at (12, 161). Then Renders a magenta line between points (84, 9) and (166, 212).
; PLAN: r0=12(x), r1=161(y), r2=36(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=84(x1), r1=9(y1), r2=166(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta box of size 36x94 starting at (12, 161).
; PLAN: r0=12(x), r1=161(y), r2=36(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 161
LDI r2, 36
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (84, 9) and (166, 212).
; PLAN: r0=84(x1), r1=9(y1), r2=166(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 9
LDI r2, 166
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
