; DESCRIPTION: Creates a red rectangular region at (35, 65) spanning 51 by 95 pixels.
; PLAN: r0=35(x), r1=65(y), r2=51(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 65
LDI r2, 51
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
