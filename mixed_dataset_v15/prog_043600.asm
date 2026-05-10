; DESCRIPTION: Creates a blue filled rectangle of size 44x26 starting at (394, 84).
; PLAN: r0=394(x), r1=84(y), r2=44(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 84
LDI r2, 44
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
