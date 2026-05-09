; DESCRIPTION: Renders a cyan box of size 82x118 starting at (46, 121).
; PLAN: r0=46(x), r1=121(y), r2=82(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 121
LDI r2, 82
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
