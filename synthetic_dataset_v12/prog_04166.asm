; DESCRIPTION: Creates a green rectangular region at (251, 168) spanning 56 by 28 pixels.
; PLAN: r0=251(x), r1=168(y), r2=56(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 168
LDI r2, 56
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
