; DESCRIPTION: Renders a cyan box of size 115x23 starting at (78, 9).
; PLAN: r0=78(x), r1=9(y), r2=115(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 9
LDI r2, 115
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
