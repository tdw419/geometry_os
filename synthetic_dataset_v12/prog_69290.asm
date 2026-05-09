; DESCRIPTION: Creates a green rectangular region at (68, 38) spanning 67 by 98 pixels.
; PLAN: r0=68(x), r1=38(y), r2=67(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 38
LDI r2, 67
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
