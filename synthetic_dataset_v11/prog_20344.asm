; DESCRIPTION: Composite: . Then Places a red line segment connecting (196, 58) to (227, 215). Then Creates a red circular shape at (195, 133) with radius 59.
; PLAN: r0=196(x1), r1=58(y1), r2=227(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=195(x), r1=133(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (196, 58) to (227, 215).
; PLAN: r0=196(x1), r1=58(y1), r2=227(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 58
LDI r2, 227
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (195, 133) with radius 59.
; PLAN: r0=195(x), r1=133(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 133
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
