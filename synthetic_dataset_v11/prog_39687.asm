; DESCRIPTION: Composite: . Then Renders a green box of size 30x32 starting at (177, 97). Then Places a magenta line segment connecting (113, 7) to (248, 206).
; PLAN: r0=177(x), r1=97(y), r2=30(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=113(x1), r1=7(y1), r2=248(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green box of size 30x32 starting at (177, 97).
; PLAN: r0=177(x), r1=97(y), r2=30(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 97
LDI r2, 30
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta line segment connecting (113, 7) to (248, 206).
; PLAN: r0=113(x1), r1=7(y1), r2=248(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 7
LDI r2, 248
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
