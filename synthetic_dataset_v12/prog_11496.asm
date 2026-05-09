; DESCRIPTION: Creates a green rectangular region at (418, 114) spanning 24 by 117 pixels.
; PLAN: r0=418(x), r1=114(y), r2=24(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 114
LDI r2, 24
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
