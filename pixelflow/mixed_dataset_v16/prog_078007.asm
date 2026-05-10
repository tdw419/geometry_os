; DESCRIPTION: Creates a red rectangular region at (50, 77) spanning 116 by 80 pixels.
; PLAN: r0=50(x), r1=77(y), r2=116(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 77
LDI r2, 116
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
