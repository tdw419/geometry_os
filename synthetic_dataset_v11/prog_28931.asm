; DESCRIPTION: Creates a magenta rectangular region at (144, 27) spanning 17 by 51 pixels.
; PLAN: r0=144(x), r1=27(y), r2=17(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 27
LDI r2, 17
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
