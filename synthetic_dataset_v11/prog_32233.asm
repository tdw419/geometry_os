; DESCRIPTION: Creates a red rectangular region at (20, 54) spanning 67 by 68 pixels.
; PLAN: r0=20(x), r1=54(y), r2=67(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 54
LDI r2, 67
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
