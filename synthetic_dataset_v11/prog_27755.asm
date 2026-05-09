; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (210, 249) to (31, 120). Then Creates a orange rectangular region at (149, 91) spanning 65 by 78 pixels.
; PLAN: r0=210(x1), r1=249(y1), r2=31(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=149(x), r1=91(y), r2=65(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta line segment connecting (210, 249) to (31, 120).
; PLAN: r0=210(x1), r1=249(y1), r2=31(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 249
LDI r2, 31
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange rectangular region at (149, 91) spanning 65 by 78 pixels.
; PLAN: r0=149(x), r1=91(y), r2=65(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 91
LDI r2, 65
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
