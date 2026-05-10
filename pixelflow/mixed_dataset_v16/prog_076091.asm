; DESCRIPTION: Renders a cyan box of size 101x65 starting at (390, 137).
; PLAN: r0=390(x), r1=137(y), r2=101(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 137
LDI r2, 101
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
