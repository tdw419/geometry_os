; DESCRIPTION: Creates a yellow filled rectangle of size 15x83 starting at (82, 44).
; PLAN: r0=82(x), r1=44(y), r2=15(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 44
LDI r2, 15
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
