; DESCRIPTION: Renders a green box of size 71x72 starting at (131, 66).
; PLAN: r0=131(x), r1=66(y), r2=71(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 66
LDI r2, 71
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
