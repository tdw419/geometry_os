; DESCRIPTION: Composite: . Then Renders a blue box of size 39x52 starting at (203, 147). Then Places a white line segment connecting (124, 166) to (54, 103).
; PLAN: r0=203(x), r1=147(y), r2=39(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=124(x1), r1=166(y1), r2=54(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue box of size 39x52 starting at (203, 147).
; PLAN: r0=203(x), r1=147(y), r2=39(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 147
LDI r2, 39
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white line segment connecting (124, 166) to (54, 103).
; PLAN: r0=124(x1), r1=166(y1), r2=54(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 166
LDI r2, 54
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
