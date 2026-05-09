; DESCRIPTION: Renders a green box of size 52x56 starting at (7, 119).
; PLAN: r0=7(x), r1=119(y), r2=52(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 119
LDI r2, 52
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
