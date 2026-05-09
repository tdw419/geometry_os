; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (2, 203) spanning 114 by 21 pixels. Then Places a red line segment connecting (122, 57) to (94, 228).
; PLAN: r0=2(x), r1=203(y), r2=114(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=122(x1), r1=57(y1), r2=94(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue rectangular region at (2, 203) spanning 114 by 21 pixels.
; PLAN: r0=2(x), r1=203(y), r2=114(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 203
LDI r2, 114
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (122, 57) to (94, 228).
; PLAN: r0=122(x1), r1=57(y1), r2=94(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 57
LDI r2, 94
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
