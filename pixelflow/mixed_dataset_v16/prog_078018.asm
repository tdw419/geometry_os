; DESCRIPTION: Creates a yellow rectangular region at (302, 190) spanning 14 by 65 pixels.
; PLAN: r0=302(x), r1=190(y), r2=14(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 190
LDI r2, 14
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
