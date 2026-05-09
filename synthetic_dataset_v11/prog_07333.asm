; DESCRIPTION: Creates a green rectangular region at (217, 28) spanning 27 by 80 pixels.
; PLAN: r0=217(x), r1=28(y), r2=27(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 28
LDI r2, 27
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
