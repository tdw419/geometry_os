; DESCRIPTION: Renders a cyan box of size 63x17 starting at (162, 101).
; PLAN: r0=162(x), r1=101(y), r2=63(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 101
LDI r2, 63
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
