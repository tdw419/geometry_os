; DESCRIPTION: Creates a yellow rectangular region at (177, 75) spanning 65 by 50 pixels.
; PLAN: r0=177(x), r1=75(y), r2=65(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 75
LDI r2, 65
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
