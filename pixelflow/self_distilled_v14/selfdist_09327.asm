; DESCRIPTION: Renders a white rectangular region spanning 96 by 101 at (371, 161).
; PLAN: r0=371(x), r1=161(y), r2=96(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 161
LDI r2, 96
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
