; DESCRIPTION: Creates a blue rectangular region at (190, 203) spanning 51 by 27 pixels.
; PLAN: r0=190(x), r1=203(y), r2=51(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 203
LDI r2, 51
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
