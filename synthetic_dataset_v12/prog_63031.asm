; DESCRIPTION: Renders a cyan box of size 29x97 starting at (159, 20).
; PLAN: r0=159(x), r1=20(y), r2=29(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 20
LDI r2, 29
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
