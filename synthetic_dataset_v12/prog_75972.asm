; DESCRIPTION: Renders a cyan box of size 115x118 starting at (303, 43).
; PLAN: r0=303(x), r1=43(y), r2=115(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 43
LDI r2, 115
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
