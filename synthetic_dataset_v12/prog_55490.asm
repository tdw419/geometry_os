; DESCRIPTION: Creates a white rectangular region at (315, 28) spanning 80 by 86 pixels.
; PLAN: r0=315(x), r1=28(y), r2=80(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 28
LDI r2, 80
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
