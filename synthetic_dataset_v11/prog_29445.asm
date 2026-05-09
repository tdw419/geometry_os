; DESCRIPTION: Composite: . Then Draws a green line from (219, 45) to (143, 211). Then Renders a yellow box of size 100x26 starting at (29, 64).
; PLAN: r0=219(x1), r1=45(y1), r2=143(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=29(x), r1=64(y), r2=100(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green line from (219, 45) to (143, 211).
; PLAN: r0=219(x1), r1=45(y1), r2=143(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 45
LDI r2, 143
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow box of size 100x26 starting at (29, 64).
; PLAN: r0=29(x), r1=64(y), r2=100(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 64
LDI r2, 100
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
