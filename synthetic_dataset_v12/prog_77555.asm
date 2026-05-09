; DESCRIPTION: Renders a red box of size 81x97 starting at (201, 154).
; PLAN: r0=201(x), r1=154(y), r2=81(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 154
LDI r2, 81
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
