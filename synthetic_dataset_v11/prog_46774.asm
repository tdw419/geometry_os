; DESCRIPTION: Creates a black rectangular region at (120, 125) spanning 114 by 27 pixels.
; PLAN: r0=120(x), r1=125(y), r2=114(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 125
LDI r2, 114
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
