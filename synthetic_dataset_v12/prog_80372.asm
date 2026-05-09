; DESCRIPTION: Creates a green rectangular region at (372, 60) spanning 95 by 26 pixels.
; PLAN: r0=372(x), r1=60(y), r2=95(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 60
LDI r2, 95
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
