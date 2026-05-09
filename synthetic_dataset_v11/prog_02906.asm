; DESCRIPTION: Composite: . Then Draws a white rectangle at (11, 44) with width 108 and height 116. Then Places a white line segment connecting (72, 30) to (102, 102).
; PLAN: r0=11(x), r1=44(y), r2=108(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=72(x1), r1=30(y1), r2=102(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (11, 44) with width 108 and height 116.
; PLAN: r0=11(x), r1=44(y), r2=108(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 44
LDI r2, 108
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white line segment connecting (72, 30) to (102, 102).
; PLAN: r0=72(x1), r1=30(y1), r2=102(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 30
LDI r2, 102
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
