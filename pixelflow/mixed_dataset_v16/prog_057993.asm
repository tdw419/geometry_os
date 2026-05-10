; DESCRIPTION: Creates a green rectangular region at (51, 218) spanning 16 by 28 pixels.
; PLAN: r0=51(x), r1=218(y), r2=16(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 218
LDI r2, 16
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
