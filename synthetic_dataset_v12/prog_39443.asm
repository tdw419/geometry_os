; DESCRIPTION: Renders a green box of size 20x119 starting at (281, 36).
; PLAN: r0=281(x), r1=36(y), r2=20(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 36
LDI r2, 20
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
