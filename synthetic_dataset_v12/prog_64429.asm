; DESCRIPTION: Creates a red rectangular region at (237, 79) spanning 47 by 67 pixels.
; PLAN: r0=237(x), r1=79(y), r2=47(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 79
LDI r2, 47
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
