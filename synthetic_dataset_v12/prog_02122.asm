; DESCRIPTION: Renders a black box of size 31x117 starting at (176, 68).
; PLAN: r0=176(x), r1=68(y), r2=31(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 68
LDI r2, 31
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
