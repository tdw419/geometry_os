; DESCRIPTION: Composite: . Then Creates a red rectangular region at (112, 28) spanning 103 by 13 pixels. Then Places a cyan line segment connecting (108, 84) to (172, 77).
; PLAN: r0=112(x), r1=28(y), r2=103(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=108(x1), r1=84(y1), r2=172(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red rectangular region at (112, 28) spanning 103 by 13 pixels.
; PLAN: r0=112(x), r1=28(y), r2=103(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 28
LDI r2, 103
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (108, 84) to (172, 77).
; PLAN: r0=108(x1), r1=84(y1), r2=172(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 84
LDI r2, 172
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
