; DESCRIPTION: Creates a red rectangular region at (178, 179) spanning 28 by 52 pixels.
; PLAN: r0=178(x), r1=179(y), r2=28(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 179
LDI r2, 28
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
