; DESCRIPTION: Creates a orange rectangular region at (20, 168) spanning 116 by 27 pixels.
; PLAN: r0=20(x), r1=168(y), r2=116(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 168
LDI r2, 116
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
