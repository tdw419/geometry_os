; DESCRIPTION: Creates a black rectangular region at (137, 220) spanning 115 by 27 pixels.
; PLAN: r0=137(x), r1=220(y), r2=115(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 220
LDI r2, 115
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
