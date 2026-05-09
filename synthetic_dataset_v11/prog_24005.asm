; DESCRIPTION: Composite: . Then Creates a black rectangular region at (106, 23) spanning 87 by 37 pixels. Then Places a green line segment connecting (194, 103) to (141, 51).
; PLAN: r0=106(x), r1=23(y), r2=87(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=194(x1), r1=103(y1), r2=141(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black rectangular region at (106, 23) spanning 87 by 37 pixels.
; PLAN: r0=106(x), r1=23(y), r2=87(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 23
LDI r2, 87
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green line segment connecting (194, 103) to (141, 51).
; PLAN: r0=194(x1), r1=103(y1), r2=141(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 103
LDI r2, 141
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
