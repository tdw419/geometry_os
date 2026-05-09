; DESCRIPTION: Creates a green rectangular region at (240, 27) spanning 51 by 71 pixels.
; PLAN: r0=240(x), r1=27(y), r2=51(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 27
LDI r2, 51
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
