; DESCRIPTION: Renders a green box of size 99x10 starting at (154, 49).
; PLAN: r0=154(x), r1=49(y), r2=99(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 49
LDI r2, 99
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
