; DESCRIPTION: Composite: . Then Draws a purple circle centered at (72, 153) with radius 36. Then Renders a green line between points (182, 40) and (236, 152).
; PLAN: r0=72(x), r1=153(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=182(x1), r1=40(y1), r2=236(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (72, 153) with radius 36.
; PLAN: r0=72(x), r1=153(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 153
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green line between points (182, 40) and (236, 152).
; PLAN: r0=182(x1), r1=40(y1), r2=236(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 40
LDI r2, 236
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
