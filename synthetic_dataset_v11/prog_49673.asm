; DESCRIPTION: Renders a green box of size 12x68 starting at (235, 89).
; PLAN: r0=235(x), r1=89(y), r2=12(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 89
LDI r2, 12
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
