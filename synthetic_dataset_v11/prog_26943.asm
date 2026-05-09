; DESCRIPTION: Composite: . Then Creates a blue circular shape at (39, 207) with radius 28. Then Draws a white line from (172, 25) to (230, 197).
; PLAN: r0=39(x), r1=207(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=172(x1), r1=25(y1), r2=230(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue circular shape at (39, 207) with radius 28.
; PLAN: r0=39(x), r1=207(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 207
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (172, 25) to (230, 197).
; PLAN: r0=172(x1), r1=25(y1), r2=230(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 25
LDI r2, 230
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
