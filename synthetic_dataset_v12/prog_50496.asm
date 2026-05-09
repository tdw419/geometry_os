; DESCRIPTION: Places a red 115x78 rectangle at position (135, 77).
; PLAN: r0=135(x), r1=77(y), r2=115(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 77
LDI r2, 115
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
