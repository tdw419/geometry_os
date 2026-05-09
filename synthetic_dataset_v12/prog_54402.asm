; DESCRIPTION: Renders a green box of size 86x58 starting at (134, 80).
; PLAN: r0=134(x), r1=80(y), r2=86(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 80
LDI r2, 86
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
