; DESCRIPTION: Renders a green box of size 62x57 starting at (437, 108).
; PLAN: r0=437(x), r1=108(y), r2=62(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 108
LDI r2, 62
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
