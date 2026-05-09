; DESCRIPTION: Composite: . Then Renders a magenta line between points (48, 110) and (130, 80). Then Renders a purple box of size 107x117 starting at (125, 135).
; PLAN: r0=48(x1), r1=110(y1), r2=130(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=125(x), r1=135(y), r2=107(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta line between points (48, 110) and (130, 80).
; PLAN: r0=48(x1), r1=110(y1), r2=130(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 110
LDI r2, 130
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 107x117 starting at (125, 135).
; PLAN: r0=125(x), r1=135(y), r2=107(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 135
LDI r2, 107
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
