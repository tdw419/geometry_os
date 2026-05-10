; DESCRIPTION: Renders a cyan box of size 88x58 starting at (259, 109).
; PLAN: r0=259(x), r1=109(y), r2=88(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 109
LDI r2, 88
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
