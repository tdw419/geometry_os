; DESCRIPTION: Renders a cyan box of size 114x78 starting at (287, 139).
; PLAN: r0=287(x), r1=139(y), r2=114(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 139
LDI r2, 114
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
