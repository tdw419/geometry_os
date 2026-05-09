; DESCRIPTION: Creates a yellow rectangular region at (86, 96) spanning 70 by 27 pixels.
; PLAN: r0=86(x), r1=96(y), r2=70(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 96
LDI r2, 70
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
