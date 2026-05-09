; DESCRIPTION: Renders a cyan box of size 110x84 starting at (364, 154).
; PLAN: r0=364(x), r1=154(y), r2=110(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 154
LDI r2, 110
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
