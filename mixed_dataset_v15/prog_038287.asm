; DESCRIPTION: Renders a blue box of size 40x25 starting at (303, 154).
; PLAN: r0=303(x), r1=154(y), r2=40(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 154
LDI r2, 40
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
