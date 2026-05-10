; DESCRIPTION: Composite: Places a green line segment connecting (329, 48) to (308, 210) then Draws a blue rectangle at (238, 103) with width 89 and height 15.
; PLAN: r0=329(x1), r1=48(y1), r2=308(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=103(y), r7=89(width), r8=15(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 48
LDI r2, 308
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 103
LDI r7, 89
LDI r8, 15
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
