; DESCRIPTION: Renders a green box of size 98x109 starting at (1, 28).
; PLAN: r0=1(x), r1=28(y), r2=98(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 28
LDI r2, 98
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
