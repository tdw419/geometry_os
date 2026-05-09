; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (15, 163) spanning 109 by 61 pixels. Then Places a white line segment connecting (123, 156) to (130, 80).
; PLAN: r0=15(x), r1=163(y), r2=109(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=123(x1), r1=156(y1), r2=130(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan rectangular region at (15, 163) spanning 109 by 61 pixels.
; PLAN: r0=15(x), r1=163(y), r2=109(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 163
LDI r2, 109
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white line segment connecting (123, 156) to (130, 80).
; PLAN: r0=123(x1), r1=156(y1), r2=130(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 156
LDI r2, 130
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
