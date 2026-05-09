; DESCRIPTION: Composite: . Then Draws a black line from (176, 93) to (185, 39). Then Places a cyan circle of radius 44 at center (67, 127).
; PLAN: r0=176(x1), r1=93(y1), r2=185(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=67(x), r1=127(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (176, 93) to (185, 39).
; PLAN: r0=176(x1), r1=93(y1), r2=185(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 93
LDI r2, 185
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 44 at center (67, 127).
; PLAN: r0=67(x), r1=127(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 127
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
