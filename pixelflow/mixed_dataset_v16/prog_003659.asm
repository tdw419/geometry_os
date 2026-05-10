; DESCRIPTION: Creates a purple filled rectangle of size 37x71 starting at (275, 94).
; PLAN: r0=275(x), r1=94(y), r2=37(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 94
LDI r2, 37
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
