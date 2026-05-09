; DESCRIPTION: Creates a yellow rectangular region at (240, 194) spanning 48 by 52 pixels.
; PLAN: r0=240(x), r1=194(y), r2=48(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 194
LDI r2, 48
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
