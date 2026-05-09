; DESCRIPTION: Creates a green rectangular region at (210, 39) spanning 13 by 51 pixels.
; PLAN: r0=210(x), r1=39(y), r2=13(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 39
LDI r2, 13
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
