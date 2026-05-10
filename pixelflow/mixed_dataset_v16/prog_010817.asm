; DESCRIPTION: Creates a red rectangular region at (25, 16) spanning 112 by 100 pixels.
; PLAN: r0=25(x), r1=16(y), r2=112(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 16
LDI r2, 112
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
