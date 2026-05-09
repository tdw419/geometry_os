; DESCRIPTION: Renders a cyan box of size 101x91 starting at (25, 72).
; PLAN: r0=25(x), r1=72(y), r2=101(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 72
LDI r2, 101
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
