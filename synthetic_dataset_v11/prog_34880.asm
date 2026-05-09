; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (234, 136) to (140, 59). Then Draws a white rectangle at (58, 27) with width 114 and height 72.
; PLAN: r0=234(x1), r1=136(y1), r2=140(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=58(x), r1=27(y), r2=114(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow line segment connecting (234, 136) to (140, 59).
; PLAN: r0=234(x1), r1=136(y1), r2=140(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 136
LDI r2, 140
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (58, 27) with width 114 and height 72.
; PLAN: r0=58(x), r1=27(y), r2=114(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 27
LDI r2, 114
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
