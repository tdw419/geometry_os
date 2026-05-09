; DESCRIPTION: Composite: . Then Creates a white rectangular region at (64, 38) spanning 52 by 67 pixels. Then Places a cyan line segment connecting (122, 154) to (14, 116).
; PLAN: r0=64(x), r1=38(y), r2=52(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=122(x1), r1=154(y1), r2=14(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white rectangular region at (64, 38) spanning 52 by 67 pixels.
; PLAN: r0=64(x), r1=38(y), r2=52(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 38
LDI r2, 52
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (122, 154) to (14, 116).
; PLAN: r0=122(x1), r1=154(y1), r2=14(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 154
LDI r2, 14
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
