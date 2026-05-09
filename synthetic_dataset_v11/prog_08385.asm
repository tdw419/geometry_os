; DESCRIPTION: Renders a green box of size 82x106 starting at (64, 4).
; PLAN: r0=64(x), r1=4(y), r2=82(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 4
LDI r2, 82
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
