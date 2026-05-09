; DESCRIPTION: Creates a blue rectangular region at (175, 190) spanning 27 by 30 pixels.
; PLAN: r0=175(x), r1=190(y), r2=27(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 190
LDI r2, 27
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
