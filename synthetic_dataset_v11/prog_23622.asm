; DESCRIPTION: Renders a cyan box of size 90x101 starting at (164, 99).
; PLAN: r0=164(x), r1=99(y), r2=90(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 99
LDI r2, 90
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
