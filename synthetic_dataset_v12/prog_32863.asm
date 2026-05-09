; DESCRIPTION: Creates a red rectangular region at (206, 75) spanning 21 by 96 pixels.
; PLAN: r0=206(x), r1=75(y), r2=21(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 75
LDI r2, 21
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
