; DESCRIPTION: Composite: . Then Places a cyan circle of radius 26 at center (157, 189). Then Draws a yellow line from (56, 177) to (55, 20).
; PLAN: r0=157(x), r1=189(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=56(x1), r1=177(y1), r2=55(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 26 at center (157, 189).
; PLAN: r0=157(x), r1=189(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 189
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow line from (56, 177) to (55, 20).
; PLAN: r0=56(x1), r1=177(y1), r2=55(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 177
LDI r2, 55
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
