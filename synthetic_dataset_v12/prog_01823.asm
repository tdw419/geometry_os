; DESCRIPTION: Creates a yellow rectangular region at (195, 180) spanning 83 by 24 pixels.
; PLAN: r0=195(x), r1=180(y), r2=83(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 180
LDI r2, 83
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
