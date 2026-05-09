; DESCRIPTION: Creates a red rectangular region at (165, 62) spanning 80 by 95 pixels.
; PLAN: r0=165(x), r1=62(y), r2=80(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 62
LDI r2, 80
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
