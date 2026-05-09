; DESCRIPTION: Creates a red rectangular region at (132, 81) spanning 52 by 93 pixels.
; PLAN: r0=132(x), r1=81(y), r2=52(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 81
LDI r2, 52
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
