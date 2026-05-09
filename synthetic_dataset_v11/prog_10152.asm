; DESCRIPTION: Composite: . Then Draws a cyan line from (198, 17) to (15, 16). Then Places a purple circle of radius 76 at center (107, 180).
; PLAN: r0=198(x1), r1=17(y1), r2=15(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=107(x), r1=180(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (198, 17) to (15, 16).
; PLAN: r0=198(x1), r1=17(y1), r2=15(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 17
LDI r2, 15
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 76 at center (107, 180).
; PLAN: r0=107(x), r1=180(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 180
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
