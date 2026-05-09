; DESCRIPTION: Renders a cyan box of size 68x13 starting at (52, 147).
; PLAN: r0=52(x), r1=147(y), r2=68(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 147
LDI r2, 68
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
