; DESCRIPTION: Composite: . Then Draws a yellow line from (59, 62) to (204, 190). Then Places a yellow circle of radius 19 at center (40, 231).
; PLAN: r0=59(x1), r1=62(y1), r2=204(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=40(x), r1=231(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (59, 62) to (204, 190).
; PLAN: r0=59(x1), r1=62(y1), r2=204(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 62
LDI r2, 204
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 19 at center (40, 231).
; PLAN: r0=40(x), r1=231(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 231
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
