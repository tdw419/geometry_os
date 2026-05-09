; DESCRIPTION: Composite: . Then Draws a white rectangle at (124, 163) with width 109 and height 71. Then Draws a blue line from (249, 13) to (199, 240).
; PLAN: r0=124(x), r1=163(y), r2=109(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=249(x1), r1=13(y1), r2=199(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (124, 163) with width 109 and height 71.
; PLAN: r0=124(x), r1=163(y), r2=109(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 163
LDI r2, 109
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue line from (249, 13) to (199, 240).
; PLAN: r0=249(x1), r1=13(y1), r2=199(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 13
LDI r2, 199
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
