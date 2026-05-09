; DESCRIPTION: Composite: . Then Places a white line segment connecting (198, 96) to (18, 88). Then Creates a green rectangular region at (202, 137) spanning 21 by 94 pixels.
; PLAN: r0=198(x1), r1=96(y1), r2=18(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=202(x), r1=137(y), r2=21(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white line segment connecting (198, 96) to (18, 88).
; PLAN: r0=198(x1), r1=96(y1), r2=18(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 96
LDI r2, 18
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green rectangular region at (202, 137) spanning 21 by 94 pixels.
; PLAN: r0=202(x), r1=137(y), r2=21(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 137
LDI r2, 21
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
