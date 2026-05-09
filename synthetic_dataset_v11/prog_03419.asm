; DESCRIPTION: Composite: . Then Renders a white box of size 51x19 starting at (199, 0). Then Places a blue line segment connecting (223, 180) to (187, 159).
; PLAN: r0=199(x), r1=0(y), r2=51(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=223(x1), r1=180(y1), r2=187(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white box of size 51x19 starting at (199, 0).
; PLAN: r0=199(x), r1=0(y), r2=51(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 0
LDI r2, 51
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue line segment connecting (223, 180) to (187, 159).
; PLAN: r0=223(x1), r1=180(y1), r2=187(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 180
LDI r2, 187
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
