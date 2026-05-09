; DESCRIPTION: Creates a green rectangular region at (354, 138) spanning 90 by 86 pixels.
; PLAN: r0=354(x), r1=138(y), r2=90(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 138
LDI r2, 90
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
