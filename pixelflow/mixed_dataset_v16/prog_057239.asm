; DESCRIPTION: Renders a purple box of size 99x57 starting at (397, 186).
; PLAN: r0=397(x), r1=186(y), r2=99(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 186
LDI r2, 99
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
