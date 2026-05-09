; DESCRIPTION: Creates a orange rectangular region at (82, 116) spanning 40 by 95 pixels.
; PLAN: r0=82(x), r1=116(y), r2=40(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 116
LDI r2, 40
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
