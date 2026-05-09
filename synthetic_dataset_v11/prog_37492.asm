; DESCRIPTION: Composite: . Then Renders a black box of size 51x118 starting at (158, 10). Then Places a cyan line segment connecting (128, 81) to (206, 235).
; PLAN: r0=158(x), r1=10(y), r2=51(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=128(x1), r1=81(y1), r2=206(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black box of size 51x118 starting at (158, 10).
; PLAN: r0=158(x), r1=10(y), r2=51(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 10
LDI r2, 51
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (128, 81) to (206, 235).
; PLAN: r0=128(x1), r1=81(y1), r2=206(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 81
LDI r2, 206
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
