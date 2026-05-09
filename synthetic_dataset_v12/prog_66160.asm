; DESCRIPTION: Renders a cyan box of size 74x106 starting at (46, 122).
; PLAN: r0=46(x), r1=122(y), r2=74(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 122
LDI r2, 74
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
