; DESCRIPTION: Creates a red rectangular region at (105, 116) spanning 54 by 10 pixels.
; PLAN: r0=105(x), r1=116(y), r2=54(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 116
LDI r2, 54
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
