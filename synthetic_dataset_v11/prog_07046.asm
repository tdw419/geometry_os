; DESCRIPTION: Composite: . Then Draws a purple line from (248, 124) to (134, 235). Then Renders a white box of size 90x80 starting at (132, 67).
; PLAN: r0=248(x1), r1=124(y1), r2=134(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=132(x), r1=67(y), r2=90(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple line from (248, 124) to (134, 235).
; PLAN: r0=248(x1), r1=124(y1), r2=134(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 124
LDI r2, 134
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white box of size 90x80 starting at (132, 67).
; PLAN: r0=132(x), r1=67(y), r2=90(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 67
LDI r2, 90
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
