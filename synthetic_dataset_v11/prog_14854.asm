; DESCRIPTION: Composite: . Then Draws a green line from (21, 246) to (235, 130). Then Renders a purple box of size 57x108 starting at (162, 71).
; PLAN: r0=21(x1), r1=246(y1), r2=235(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=162(x), r1=71(y), r2=57(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green line from (21, 246) to (235, 130).
; PLAN: r0=21(x1), r1=246(y1), r2=235(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 246
LDI r2, 235
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 57x108 starting at (162, 71).
; PLAN: r0=162(x), r1=71(y), r2=57(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 71
LDI r2, 57
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
