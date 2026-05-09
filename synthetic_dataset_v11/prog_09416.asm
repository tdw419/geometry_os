; DESCRIPTION: Renders a purple box of size 95x80 starting at (96, 154).
; PLAN: r0=96(x), r1=154(y), r2=95(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 154
LDI r2, 95
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
