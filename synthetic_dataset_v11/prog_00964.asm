; DESCRIPTION: Composite: . Then Places a green 78x54 rectangle at position (7, 156). Then Draws a black line from (136, 171) to (55, 208).
; PLAN: r0=7(x), r1=156(y), r2=78(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=136(x1), r1=171(y1), r2=55(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green 78x54 rectangle at position (7, 156).
; PLAN: r0=7(x), r1=156(y), r2=78(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 156
LDI r2, 78
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black line from (136, 171) to (55, 208).
; PLAN: r0=136(x1), r1=171(y1), r2=55(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 171
LDI r2, 55
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
