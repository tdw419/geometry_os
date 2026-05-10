; DESCRIPTION: Creates a purple rectangular region at (70, 182) spanning 91 by 16 pixels.
; PLAN: r0=70(x), r1=182(y), r2=91(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 182
LDI r2, 91
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
