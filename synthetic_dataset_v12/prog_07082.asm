; DESCRIPTION: Renders a green box of size 11x115 starting at (196, 56).
; PLAN: r0=196(x), r1=56(y), r2=11(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 56
LDI r2, 11
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
