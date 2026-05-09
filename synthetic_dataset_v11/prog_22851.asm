; DESCRIPTION: Renders a green box of size 22x21 starting at (182, 10).
; PLAN: r0=182(x), r1=10(y), r2=22(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 10
LDI r2, 22
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
