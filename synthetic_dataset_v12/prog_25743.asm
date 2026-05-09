; DESCRIPTION: Renders a green box of size 76x11 starting at (279, 70).
; PLAN: r0=279(x), r1=70(y), r2=76(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 70
LDI r2, 76
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
