; DESCRIPTION: Composite: . Then Renders a blue box of size 80x26 starting at (106, 114). Then Renders a magenta line between points (166, 237) and (161, 0).
; PLAN: r0=106(x), r1=114(y), r2=80(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=166(x1), r1=237(y1), r2=161(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue box of size 80x26 starting at (106, 114).
; PLAN: r0=106(x), r1=114(y), r2=80(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 114
LDI r2, 80
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (166, 237) and (161, 0).
; PLAN: r0=166(x1), r1=237(y1), r2=161(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 237
LDI r2, 161
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
