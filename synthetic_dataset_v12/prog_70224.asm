; DESCRIPTION: Renders a cyan box of size 18x36 starting at (19, 176).
; PLAN: r0=19(x), r1=176(y), r2=18(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 176
LDI r2, 18
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
