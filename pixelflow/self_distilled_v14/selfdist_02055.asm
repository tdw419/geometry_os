; DESCRIPTION: Creates a green filled rectangle of size 82x108 starting at (185, 46).
; PLAN: r0=185(x), r1=46(y), r2=82(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 46
LDI r2, 82
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
