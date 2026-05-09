; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (130, 79) with radius 69. Then Places a purple line segment connecting (72, 246) to (13, 213).
; PLAN: r0=130(x), r1=79(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=72(x1), r1=246(y1), r2=13(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (130, 79) with radius 69.
; PLAN: r0=130(x), r1=79(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 79
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (72, 246) to (13, 213).
; PLAN: r0=72(x1), r1=246(y1), r2=13(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 246
LDI r2, 13
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
