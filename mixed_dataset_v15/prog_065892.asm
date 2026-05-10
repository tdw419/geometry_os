; DESCRIPTION: Creates a purple filled rectangle of size 33x27 starting at (231, 171).
; PLAN: r0=231(x), r1=171(y), r2=33(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 171
LDI r2, 33
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
