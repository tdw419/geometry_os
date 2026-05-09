; DESCRIPTION: Creates a purple rectangular region at (3, 173) spanning 98 by 46 pixels.
; PLAN: r0=3(x), r1=173(y), r2=98(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 173
LDI r2, 98
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
