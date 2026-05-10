; DESCRIPTION: Creates a blue filled rectangle of size 21x69 starting at (394, 197).
; PLAN: r0=394(x), r1=197(y), r2=21(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 197
LDI r2, 21
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
