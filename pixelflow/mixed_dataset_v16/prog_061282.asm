; DESCRIPTION: Creates a black rectangular region at (300, 81) spanning 54 by 48 pixels.
; PLAN: r0=300(x), r1=81(y), r2=54(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 81
LDI r2, 54
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
