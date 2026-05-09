; DESCRIPTION: Creates a red rectangular region at (30, 186) spanning 93 by 56 pixels.
; PLAN: r0=30(x), r1=186(y), r2=93(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 186
LDI r2, 93
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
