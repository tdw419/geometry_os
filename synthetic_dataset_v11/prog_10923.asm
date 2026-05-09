; DESCRIPTION: Renders a green box of size 25x66 starting at (90, 36).
; PLAN: r0=90(x), r1=36(y), r2=25(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 36
LDI r2, 25
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
