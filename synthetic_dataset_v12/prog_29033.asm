; DESCRIPTION: Creates a red rectangular region at (120, 125) spanning 86 by 118 pixels.
; PLAN: r0=120(x), r1=125(y), r2=86(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 125
LDI r2, 86
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
