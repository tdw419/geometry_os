; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (3, 56) with width 51 and height 108. Then Places a red line segment connecting (38, 204) to (108, 69).
; PLAN: r0=3(x), r1=56(y), r2=51(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=38(x1), r1=204(y1), r2=108(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow rectangle at (3, 56) with width 51 and height 108.
; PLAN: r0=3(x), r1=56(y), r2=51(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 56
LDI r2, 51
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (38, 204) to (108, 69).
; PLAN: r0=38(x1), r1=204(y1), r2=108(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 204
LDI r2, 108
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
