; DESCRIPTION: Renders a cyan box of size 12x62 starting at (230, 99).
; PLAN: r0=230(x), r1=99(y), r2=12(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 99
LDI r2, 12
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
