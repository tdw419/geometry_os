; DESCRIPTION: Creates a purple rectangular region at (391, 190) spanning 76 by 37 pixels.
; PLAN: r0=391(x), r1=190(y), r2=76(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 190
LDI r2, 76
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
