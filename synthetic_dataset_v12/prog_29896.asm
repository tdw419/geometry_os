; DESCRIPTION: Renders a green box of size 66x95 starting at (179, 71).
; PLAN: r0=179(x), r1=71(y), r2=66(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 71
LDI r2, 66
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
