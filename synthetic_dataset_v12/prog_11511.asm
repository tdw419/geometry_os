; DESCRIPTION: Creates a orange rectangular region at (307, 72) spanning 116 by 117 pixels.
; PLAN: r0=307(x), r1=72(y), r2=116(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 72
LDI r2, 116
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
