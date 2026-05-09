; DESCRIPTION: Creates a purple rectangular region at (111, 77) spanning 80 by 27 pixels.
; PLAN: r0=111(x), r1=77(y), r2=80(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 77
LDI r2, 80
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
