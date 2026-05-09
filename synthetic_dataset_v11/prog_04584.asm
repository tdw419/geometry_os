; DESCRIPTION: Renders a green box of size 50x26 starting at (10, 3).
; PLAN: r0=10(x), r1=3(y), r2=50(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 3
LDI r2, 50
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
