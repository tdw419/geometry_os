; DESCRIPTION: Renders a cyan box of size 36x68 starting at (101, 15).
; PLAN: r0=101(x), r1=15(y), r2=36(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 15
LDI r2, 36
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
