; DESCRIPTION: Creates a red rectangular region at (269, 135) spanning 107 by 51 pixels.
; PLAN: r0=269(x), r1=135(y), r2=107(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 135
LDI r2, 107
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
