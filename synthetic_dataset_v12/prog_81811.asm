; DESCRIPTION: Creates a red rectangular region at (10, 164) spanning 52 by 73 pixels.
; PLAN: r0=10(x), r1=164(y), r2=52(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 164
LDI r2, 52
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
