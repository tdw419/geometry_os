; DESCRIPTION: Creates a green rectangular region at (404, 88) spanning 71 by 118 pixels.
; PLAN: r0=404(x), r1=88(y), r2=71(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 88
LDI r2, 71
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
