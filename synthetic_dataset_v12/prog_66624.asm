; DESCRIPTION: Renders a cyan box of size 69x107 starting at (29, 99).
; PLAN: r0=29(x), r1=99(y), r2=69(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 99
LDI r2, 69
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
