; DESCRIPTION: Creates a purple rectangular region at (127, 48) spanning 77 by 86 pixels.
; PLAN: r0=127(x), r1=48(y), r2=77(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 48
LDI r2, 77
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
