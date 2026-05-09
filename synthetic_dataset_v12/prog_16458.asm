; DESCRIPTION: Creates a red rectangular region at (143, 128) spanning 118 by 120 pixels.
; PLAN: r0=143(x), r1=128(y), r2=118(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 128
LDI r2, 118
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
