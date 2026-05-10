; DESCRIPTION: Creates a purple rectangular region at (3, 70) spanning 82 by 65 pixels.
; PLAN: r0=3(x), r1=70(y), r2=82(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 70
LDI r2, 82
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
