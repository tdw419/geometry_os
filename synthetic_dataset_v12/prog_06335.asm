; DESCRIPTION: Creates a blue rectangular region at (190, 179) spanning 90 by 57 pixels.
; PLAN: r0=190(x), r1=179(y), r2=90(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 179
LDI r2, 90
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
