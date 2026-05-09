; DESCRIPTION: Renders a green box of size 25x28 starting at (90, 31).
; PLAN: r0=90(x), r1=31(y), r2=25(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 31
LDI r2, 25
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
