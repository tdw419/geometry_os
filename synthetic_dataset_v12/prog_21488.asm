; DESCRIPTION: Creates a orange rectangular region at (216, 195) spanning 29 by 17 pixels.
; PLAN: r0=216(x), r1=195(y), r2=29(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 195
LDI r2, 29
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
