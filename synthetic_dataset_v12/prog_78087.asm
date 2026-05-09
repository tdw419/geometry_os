; DESCRIPTION: Renders a black box of size 17x20 starting at (479, 235).
; PLAN: r0=479(x), r1=235(y), r2=17(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 235
LDI r2, 17
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
