; DESCRIPTION: Renders a cyan box of size 91x43 starting at (43, 99).
; PLAN: r0=43(x), r1=99(y), r2=91(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 99
LDI r2, 91
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
