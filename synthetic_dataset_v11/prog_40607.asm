; DESCRIPTION: Creates a red rectangular region at (40, 106) spanning 47 by 67 pixels.
; PLAN: r0=40(x), r1=106(y), r2=47(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 106
LDI r2, 47
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
