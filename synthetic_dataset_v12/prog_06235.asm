; DESCRIPTION: Creates a red rectangular region at (170, 144) spanning 48 by 32 pixels.
; PLAN: r0=170(x), r1=144(y), r2=48(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 144
LDI r2, 48
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
