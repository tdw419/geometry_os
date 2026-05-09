; DESCRIPTION: Creates a red rectangular region at (279, 216) spanning 96 by 29 pixels.
; PLAN: r0=279(x), r1=216(y), r2=96(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 216
LDI r2, 96
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
