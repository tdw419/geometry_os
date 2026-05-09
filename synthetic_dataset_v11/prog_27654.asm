; DESCRIPTION: Creates a green rectangular region at (0, 159) spanning 65 by 95 pixels.
; PLAN: r0=0(x), r1=159(y), r2=65(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 159
LDI r2, 65
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
