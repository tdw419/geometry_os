; DESCRIPTION: Renders a orange rectangular region spanning 118 by 96 at (32, 90).
; PLAN: r0=32(x), r1=90(y), r2=118(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 90
LDI r2, 118
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
