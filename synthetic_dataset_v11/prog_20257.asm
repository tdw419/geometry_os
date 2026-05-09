; DESCRIPTION: Renders a cyan box of size 20x11 starting at (97, 106).
; PLAN: r0=97(x), r1=106(y), r2=20(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 106
LDI r2, 20
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
