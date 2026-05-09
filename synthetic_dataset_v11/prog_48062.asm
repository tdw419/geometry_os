; DESCRIPTION: Composite: . Then Draws a magenta line from (195, 203) to (49, 57). Then Renders a blue box of size 39x63 starting at (176, 139).
; PLAN: r0=195(x1), r1=203(y1), r2=49(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=176(x), r1=139(y), r2=39(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta line from (195, 203) to (49, 57).
; PLAN: r0=195(x1), r1=203(y1), r2=49(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 203
LDI r2, 49
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 39x63 starting at (176, 139).
; PLAN: r0=176(x), r1=139(y), r2=39(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 139
LDI r2, 39
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
