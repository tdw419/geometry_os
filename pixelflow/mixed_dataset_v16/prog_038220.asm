; DESCRIPTION: Creates a orange rectangular region at (279, 45) spanning 21 by 39 pixels.
; PLAN: r0=279(x), r1=45(y), r2=21(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 45
LDI r2, 21
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
