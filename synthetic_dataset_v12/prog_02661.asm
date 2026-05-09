; DESCRIPTION: Creates a green rectangular region at (214, 67) spanning 116 by 80 pixels.
; PLAN: r0=214(x), r1=67(y), r2=116(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 67
LDI r2, 116
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
