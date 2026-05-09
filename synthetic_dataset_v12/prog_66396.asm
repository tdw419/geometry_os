; DESCRIPTION: Creates a green rectangular region at (190, 174) spanning 30 by 16 pixels.
; PLAN: r0=190(x), r1=174(y), r2=30(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 174
LDI r2, 30
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
