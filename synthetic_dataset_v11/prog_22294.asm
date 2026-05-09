; DESCRIPTION: Creates a yellow rectangular region at (54, 113) spanning 64 by 12 pixels.
; PLAN: r0=54(x), r1=113(y), r2=64(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 113
LDI r2, 64
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
