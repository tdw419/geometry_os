; DESCRIPTION: Composite: . Then Places a white line segment connecting (97, 129) to (85, 17). Then Draws a purple rectangle at (36, 45) with width 47 and height 78.
; PLAN: r0=97(x1), r1=129(y1), r2=85(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=36(x), r1=45(y), r2=47(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white line segment connecting (97, 129) to (85, 17).
; PLAN: r0=97(x1), r1=129(y1), r2=85(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 129
LDI r2, 85
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (36, 45) with width 47 and height 78.
; PLAN: r0=36(x), r1=45(y), r2=47(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 45
LDI r2, 47
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
