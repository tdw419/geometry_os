; DESCRIPTION: Renders a cyan box of size 62x118 starting at (178, 7).
; PLAN: r0=178(x), r1=7(y), r2=62(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 7
LDI r2, 62
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
