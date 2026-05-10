; DESCRIPTION: Creates a green filled rectangle of size 55x107 starting at (240, 131).
; PLAN: r0=240(x), r1=131(y), r2=55(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 131
LDI r2, 55
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
