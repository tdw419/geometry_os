; DESCRIPTION: Creates a black rectangular region at (48, 91) spanning 85 by 93 pixels.
; PLAN: r0=48(x), r1=91(y), r2=85(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 91
LDI r2, 85
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
