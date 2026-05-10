; DESCRIPTION: Creates a orange rectangular region at (103, 32) spanning 92 by 116 pixels.
; PLAN: r0=103(x), r1=32(y), r2=92(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 32
LDI r2, 92
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
