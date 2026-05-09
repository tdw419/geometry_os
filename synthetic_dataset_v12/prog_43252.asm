; DESCRIPTION: Renders a blue box of size 54x93 starting at (272, 154).
; PLAN: r0=272(x), r1=154(y), r2=54(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 154
LDI r2, 54
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
