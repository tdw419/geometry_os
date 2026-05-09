; DESCRIPTION: Renders a cyan box of size 46x22 starting at (155, 121).
; PLAN: r0=155(x), r1=121(y), r2=46(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 121
LDI r2, 46
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
