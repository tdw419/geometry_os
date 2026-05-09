; DESCRIPTION: Creates a red rectangular region at (16, 5) spanning 14 by 10 pixels.
; PLAN: r0=16(x), r1=5(y), r2=14(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 5
LDI r2, 14
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
