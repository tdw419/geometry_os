; DESCRIPTION: Renders a yellow box of size 70x23 starting at (101, 86).
; PLAN: r0=101(x), r1=86(y), r2=70(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 86
LDI r2, 70
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
