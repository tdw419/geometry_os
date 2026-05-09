; DESCRIPTION: Creates a red rectangular region at (65, 27) spanning 22 by 52 pixels.
; PLAN: r0=65(x), r1=27(y), r2=22(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 27
LDI r2, 22
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
