; DESCRIPTION: Creates a black rectangular region at (417, 80) spanning 20 by 71 pixels.
; PLAN: r0=417(x), r1=80(y), r2=20(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 80
LDI r2, 20
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
