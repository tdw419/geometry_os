; DESCRIPTION: Renders a green box of size 82x58 starting at (108, 105).
; PLAN: r0=108(x), r1=105(y), r2=82(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 105
LDI r2, 82
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
