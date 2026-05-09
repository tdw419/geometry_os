; DESCRIPTION: Creates a green rectangular region at (80, 128) spanning 44 by 82 pixels.
; PLAN: r0=80(x), r1=128(y), r2=44(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 128
LDI r2, 44
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
