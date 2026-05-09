; DESCRIPTION: Composite: . Then Renders a purple box of size 13x24 starting at (16, 203). Then Renders a magenta line between points (249, 178) and (242, 106).
; PLAN: r0=16(x), r1=203(y), r2=13(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=249(x1), r1=178(y1), r2=242(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple box of size 13x24 starting at (16, 203).
; PLAN: r0=16(x), r1=203(y), r2=13(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 203
LDI r2, 13
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (249, 178) and (242, 106).
; PLAN: r0=249(x1), r1=178(y1), r2=242(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 178
LDI r2, 242
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
