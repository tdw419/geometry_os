; DESCRIPTION: Creates a green rectangular region at (391, 4) spanning 64 by 48 pixels.
; PLAN: r0=391(x), r1=4(y), r2=64(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 4
LDI r2, 64
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
