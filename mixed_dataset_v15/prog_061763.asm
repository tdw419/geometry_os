; DESCRIPTION: Creates a red rectangular region at (128, 185) spanning 86 by 51 pixels.
; PLAN: r0=128(x), r1=185(y), r2=86(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 185
LDI r2, 86
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
