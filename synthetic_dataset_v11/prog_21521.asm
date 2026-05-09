; DESCRIPTION: Composite: . Then Draws a red rectangle at (95, 62) with width 26 and height 102. Then Places a white line segment connecting (3, 235) to (243, 126).
; PLAN: r0=95(x), r1=62(y), r2=26(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=3(x1), r1=235(y1), r2=243(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red rectangle at (95, 62) with width 26 and height 102.
; PLAN: r0=95(x), r1=62(y), r2=26(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 62
LDI r2, 26
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white line segment connecting (3, 235) to (243, 126).
; PLAN: r0=3(x1), r1=235(y1), r2=243(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 235
LDI r2, 243
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
