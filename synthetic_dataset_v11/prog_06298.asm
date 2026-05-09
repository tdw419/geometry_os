; DESCRIPTION: Composite: . Then Creates a green rectangular region at (115, 38) spanning 120 by 16 pixels. Then Places a white line segment connecting (220, 212) to (9, 116).
; PLAN: r0=115(x), r1=38(y), r2=120(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=220(x1), r1=212(y1), r2=9(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green rectangular region at (115, 38) spanning 120 by 16 pixels.
; PLAN: r0=115(x), r1=38(y), r2=120(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 38
LDI r2, 120
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white line segment connecting (220, 212) to (9, 116).
; PLAN: r0=220(x1), r1=212(y1), r2=9(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 212
LDI r2, 9
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
