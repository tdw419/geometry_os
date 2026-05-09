; DESCRIPTION: Composite: . Then Places a white line segment connecting (254, 147) to (51, 68). Then Creates a green rectangular region at (166, 153) spanning 70 by 20 pixels.
; PLAN: r0=254(x1), r1=147(y1), r2=51(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=166(x), r1=153(y), r2=70(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white line segment connecting (254, 147) to (51, 68).
; PLAN: r0=254(x1), r1=147(y1), r2=51(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 147
LDI r2, 51
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green rectangular region at (166, 153) spanning 70 by 20 pixels.
; PLAN: r0=166(x), r1=153(y), r2=70(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 153
LDI r2, 70
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
