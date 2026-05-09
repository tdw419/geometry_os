; DESCRIPTION: Creates a orange rectangular region at (95, 92) spanning 67 by 109 pixels.
; PLAN: r0=95(x), r1=92(y), r2=67(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 92
LDI r2, 67
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
