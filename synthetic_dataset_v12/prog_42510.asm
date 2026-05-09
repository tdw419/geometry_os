; DESCRIPTION: Renders a green box of size 17x115 starting at (235, 29).
; PLAN: r0=235(x), r1=29(y), r2=17(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 29
LDI r2, 17
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
