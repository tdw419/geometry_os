; DESCRIPTION: Creates a red rectangular region at (195, 134) spanning 13 by 83 pixels.
; PLAN: r0=195(x), r1=134(y), r2=13(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 134
LDI r2, 13
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
