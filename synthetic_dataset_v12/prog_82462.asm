; DESCRIPTION: Creates a black rectangular region at (273, 93) spanning 109 by 112 pixels.
; PLAN: r0=273(x), r1=93(y), r2=109(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 93
LDI r2, 109
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
