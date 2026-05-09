; DESCRIPTION: Creates a white rectangular region at (91, 86) spanning 93 by 15 pixels.
; PLAN: r0=91(x), r1=86(y), r2=93(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 86
LDI r2, 93
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
