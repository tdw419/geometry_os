; DESCRIPTION: Renders a black box of size 103x25 starting at (23, 145).
; PLAN: r0=23(x), r1=145(y), r2=103(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 145
LDI r2, 103
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
