; DESCRIPTION: Composite: . Then Draws a purple line from (248, 233) to (11, 44). Then Places a white 84x98 rectangle at position (20, 101).
; PLAN: r0=248(x1), r1=233(y1), r2=11(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=20(x), r1=101(y), r2=84(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple line from (248, 233) to (11, 44).
; PLAN: r0=248(x1), r1=233(y1), r2=11(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 233
LDI r2, 11
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white 84x98 rectangle at position (20, 101).
; PLAN: r0=20(x), r1=101(y), r2=84(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 101
LDI r2, 84
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
