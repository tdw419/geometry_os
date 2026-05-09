; DESCRIPTION: Composite: . Then Places a orange line segment connecting (128, 145) to (123, 59). Then Creates a cyan circular shape at (103, 79) with radius 61.
; PLAN: r0=128(x1), r1=145(y1), r2=123(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=103(x), r1=79(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange line segment connecting (128, 145) to (123, 59).
; PLAN: r0=128(x1), r1=145(y1), r2=123(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 145
LDI r2, 123
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (103, 79) with radius 61.
; PLAN: r0=103(x), r1=79(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 79
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
