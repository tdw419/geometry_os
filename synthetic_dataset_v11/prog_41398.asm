; DESCRIPTION: Creates a white rectangular region at (190, 65) spanning 39 by 75 pixels.
; PLAN: r0=190(x), r1=65(y), r2=39(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 65
LDI r2, 39
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
