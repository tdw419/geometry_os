; DESCRIPTION: Composite: . Then Draws a purple rectangle at (91, 154) with width 11 and height 91. Then Places a orange line segment connecting (48, 129) to (142, 72).
; PLAN: r0=91(x), r1=154(y), r2=11(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=48(x1), r1=129(y1), r2=142(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple rectangle at (91, 154) with width 11 and height 91.
; PLAN: r0=91(x), r1=154(y), r2=11(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 154
LDI r2, 11
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange line segment connecting (48, 129) to (142, 72).
; PLAN: r0=48(x1), r1=129(y1), r2=142(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 129
LDI r2, 142
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
