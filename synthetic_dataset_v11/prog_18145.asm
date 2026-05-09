; DESCRIPTION: Composite: . Then Renders a blue box of size 59x30 starting at (61, 184). Then Draws a black line from (189, 24) to (233, 98).
; PLAN: r0=61(x), r1=184(y), r2=59(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=189(x1), r1=24(y1), r2=233(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue box of size 59x30 starting at (61, 184).
; PLAN: r0=61(x), r1=184(y), r2=59(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 184
LDI r2, 59
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black line from (189, 24) to (233, 98).
; PLAN: r0=189(x1), r1=24(y1), r2=233(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 24
LDI r2, 233
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
