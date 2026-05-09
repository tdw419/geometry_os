; DESCRIPTION: Creates a red rectangular region at (180, 8) spanning 118 by 35 pixels.
; PLAN: r0=180(x), r1=8(y), r2=118(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 8
LDI r2, 118
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
