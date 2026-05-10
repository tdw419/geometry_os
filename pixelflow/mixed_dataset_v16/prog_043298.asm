; DESCRIPTION: Renders a green box of size 30x100 starting at (294, 99).
; PLAN: r0=294(x), r1=99(y), r2=30(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 99
LDI r2, 30
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
