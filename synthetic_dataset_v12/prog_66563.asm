; DESCRIPTION: Renders a cyan box of size 27x24 starting at (427, 123).
; PLAN: r0=427(x), r1=123(y), r2=27(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 123
LDI r2, 27
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
