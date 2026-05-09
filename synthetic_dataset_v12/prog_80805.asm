; DESCRIPTION: Creates a purple rectangular region at (46, 174) spanning 39 by 37 pixels.
; PLAN: r0=46(x), r1=174(y), r2=39(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 174
LDI r2, 39
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
