; DESCRIPTION: Renders a green box of size 37x39 starting at (16, 154).
; PLAN: r0=16(x), r1=154(y), r2=37(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 154
LDI r2, 37
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
