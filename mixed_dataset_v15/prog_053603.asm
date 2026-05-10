; DESCRIPTION: Renders a cyan box of size 118x68 starting at (309, 76).
; PLAN: r0=309(x), r1=76(y), r2=118(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 76
LDI r2, 118
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
