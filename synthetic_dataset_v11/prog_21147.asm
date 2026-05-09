; DESCRIPTION: Composite: . Then Places a blue line segment connecting (119, 33) to (243, 235). Then Renders a white box of size 78x114 starting at (48, 4).
; PLAN: r0=119(x1), r1=33(y1), r2=243(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=48(x), r1=4(y), r2=78(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (119, 33) to (243, 235).
; PLAN: r0=119(x1), r1=33(y1), r2=243(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 33
LDI r2, 243
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white box of size 78x114 starting at (48, 4).
; PLAN: r0=48(x), r1=4(y), r2=78(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 4
LDI r2, 78
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
