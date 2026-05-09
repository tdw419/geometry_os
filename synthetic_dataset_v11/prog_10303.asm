; DESCRIPTION: Composite: . Then Draws a cyan line from (187, 198) to (44, 47). Then Places a red circle of radius 22 at center (43, 197).
; PLAN: r0=187(x1), r1=198(y1), r2=44(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=43(x), r1=197(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (187, 198) to (44, 47).
; PLAN: r0=187(x1), r1=198(y1), r2=44(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 198
LDI r2, 44
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 22 at center (43, 197).
; PLAN: r0=43(x), r1=197(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 197
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
