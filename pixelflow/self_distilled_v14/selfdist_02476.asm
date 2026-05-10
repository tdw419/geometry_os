; DESCRIPTION: Creates a purple filled rectangle of size 39x27 starting at (288, 94).
; PLAN: r0=288(x), r1=94(y), r2=39(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 94
LDI r2, 39
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
