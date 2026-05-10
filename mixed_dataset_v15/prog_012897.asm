; DESCRIPTION: Creates a green rectangular region at (196, 81) spanning 79 by 15 pixels.
; PLAN: r0=196(x), r1=81(y), r2=79(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 81
LDI r2, 79
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
