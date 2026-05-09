; DESCRIPTION: Renders a cyan box of size 19x12 starting at (189, 188).
; PLAN: r0=189(x), r1=188(y), r2=19(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 188
LDI r2, 19
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
