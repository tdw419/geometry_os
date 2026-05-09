; DESCRIPTION: Creates a green rectangular region at (394, 4) spanning 15 by 117 pixels.
; PLAN: r0=394(x), r1=4(y), r2=15(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 4
LDI r2, 15
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
