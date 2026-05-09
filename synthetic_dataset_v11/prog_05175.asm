; DESCRIPTION: Renders a green box of size 102x49 starting at (11, 161).
; PLAN: r0=11(x), r1=161(y), r2=102(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 161
LDI r2, 102
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
