; DESCRIPTION: Composite: . Then Places a red line segment connecting (102, 63) to (149, 224). Then Creates a cyan rectangular region at (94, 62) spanning 21 by 107 pixels.
; PLAN: r0=102(x1), r1=63(y1), r2=149(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=94(x), r1=62(y), r2=21(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red line segment connecting (102, 63) to (149, 224).
; PLAN: r0=102(x1), r1=63(y1), r2=149(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 63
LDI r2, 149
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan rectangular region at (94, 62) spanning 21 by 107 pixels.
; PLAN: r0=94(x), r1=62(y), r2=21(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 62
LDI r2, 21
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
