; DESCRIPTION: Creates a orange rectangular region at (215, 58) spanning 58 by 116 pixels.
; PLAN: r0=215(x), r1=58(y), r2=58(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 58
LDI r2, 58
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
