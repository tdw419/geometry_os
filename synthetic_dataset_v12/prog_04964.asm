; DESCRIPTION: Creates a green rectangular region at (90, 103) spanning 13 by 30 pixels.
; PLAN: r0=90(x), r1=103(y), r2=13(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 103
LDI r2, 13
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
