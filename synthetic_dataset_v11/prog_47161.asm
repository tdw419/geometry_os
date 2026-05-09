; DESCRIPTION: Creates a yellow rectangular region at (27, 172) spanning 48 by 74 pixels.
; PLAN: r0=27(x), r1=172(y), r2=48(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 172
LDI r2, 48
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
