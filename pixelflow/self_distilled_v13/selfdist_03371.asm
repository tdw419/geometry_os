; DESCRIPTION: Creates a blue filled rectangle of size 98x68 starting at (39, 139).
; PLAN: r0=39(x), r1=139(y), r2=98(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 139
LDI r2, 98
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
