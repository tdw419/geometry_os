; DESCRIPTION: Creates a purple rectangular region at (358, 154) spanning 91 by 75 pixels.
; PLAN: r0=358(x), r1=154(y), r2=91(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 154
LDI r2, 91
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
