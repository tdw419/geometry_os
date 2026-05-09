; DESCRIPTION: Renders a green box of size 72x108 starting at (56, 79).
; PLAN: r0=56(x), r1=79(y), r2=72(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 79
LDI r2, 72
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
