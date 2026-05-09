; DESCRIPTION: Composite: . Then Draws a white rectangle at (61, 77) with width 63 and height 33. Then Places a yellow line segment connecting (29, 129) to (153, 40).
; PLAN: r0=61(x), r1=77(y), r2=63(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=29(x1), r1=129(y1), r2=153(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (61, 77) with width 63 and height 33.
; PLAN: r0=61(x), r1=77(y), r2=63(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 77
LDI r2, 63
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow line segment connecting (29, 129) to (153, 40).
; PLAN: r0=29(x1), r1=129(y1), r2=153(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 129
LDI r2, 153
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
