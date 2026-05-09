; DESCRIPTION: Renders a green box of size 106x11 starting at (43, 154).
; PLAN: r0=43(x), r1=154(y), r2=106(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 154
LDI r2, 106
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
