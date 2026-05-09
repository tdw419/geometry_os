; DESCRIPTION: Composite: . Then Draws a black line from (91, 164) to (142, 234). Then Creates a blue circular shape at (173, 166) with radius 26.
; PLAN: r0=91(x1), r1=164(y1), r2=142(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=173(x), r1=166(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (91, 164) to (142, 234).
; PLAN: r0=91(x1), r1=164(y1), r2=142(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 164
LDI r2, 142
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (173, 166) with radius 26.
; PLAN: r0=173(x), r1=166(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 166
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
