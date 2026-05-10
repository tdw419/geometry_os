; DESCRIPTION: Creates a blue rectangular region at (363, 205) spanning 61 by 29 pixels.
; PLAN: r0=363(x), r1=205(y), r2=61(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 205
LDI r2, 61
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
