; DESCRIPTION: Renders a green box of size 100x15 starting at (196, 50).
; PLAN: r0=196(x), r1=50(y), r2=100(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 50
LDI r2, 100
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
