; DESCRIPTION: Renders a cyan box of size 53x102 starting at (52, 78).
; PLAN: r0=52(x), r1=78(y), r2=53(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 78
LDI r2, 53
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
