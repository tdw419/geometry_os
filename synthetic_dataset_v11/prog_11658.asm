; DESCRIPTION: Composite: . Then Creates a green rectangular region at (6, 47) spanning 61 by 103 pixels. Then Places a magenta line segment connecting (66, 76) to (1, 7).
; PLAN: r0=6(x), r1=47(y), r2=61(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=66(x1), r1=76(y1), r2=1(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green rectangular region at (6, 47) spanning 61 by 103 pixels.
; PLAN: r0=6(x), r1=47(y), r2=61(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 47
LDI r2, 61
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta line segment connecting (66, 76) to (1, 7).
; PLAN: r0=66(x1), r1=76(y1), r2=1(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 76
LDI r2, 1
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
