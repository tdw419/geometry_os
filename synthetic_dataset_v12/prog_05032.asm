; DESCRIPTION: Creates a red rectangular region at (353, 12) spanning 68 by 70 pixels.
; PLAN: r0=353(x), r1=12(y), r2=68(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 12
LDI r2, 68
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
