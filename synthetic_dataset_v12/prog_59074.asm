; DESCRIPTION: Creates a red rectangular region at (299, 47) spanning 29 by 67 pixels.
; PLAN: r0=299(x), r1=47(y), r2=29(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 47
LDI r2, 29
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
