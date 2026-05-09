; DESCRIPTION: Renders a cyan box of size 22x35 starting at (8, 176).
; PLAN: r0=8(x), r1=176(y), r2=22(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 176
LDI r2, 22
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
