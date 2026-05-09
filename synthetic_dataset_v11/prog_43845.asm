; DESCRIPTION: Creates a yellow rectangular region at (180, 185) spanning 57 by 45 pixels.
; PLAN: r0=180(x), r1=185(y), r2=57(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 185
LDI r2, 57
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
