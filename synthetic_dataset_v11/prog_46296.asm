; DESCRIPTION: Creates a red rectangular region at (1, 48) spanning 44 by 101 pixels.
; PLAN: r0=1(x), r1=48(y), r2=44(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 48
LDI r2, 44
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
