; DESCRIPTION: Creates a red rectangular region at (256, 175) spanning 107 by 18 pixels.
; PLAN: r0=256(x), r1=175(y), r2=107(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 175
LDI r2, 107
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
