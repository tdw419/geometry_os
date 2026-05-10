; DESCRIPTION: Creates a green rectangular region at (291, 190) spanning 97 by 10 pixels.
; PLAN: r0=291(x), r1=190(y), r2=97(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 190
LDI r2, 97
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
