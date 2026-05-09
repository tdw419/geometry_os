; DESCRIPTION: Composite: . Then Draws a green circle centered at (25, 80) with radius 17. Then Draws a white line from (66, 114) to (189, 127).
; PLAN: r0=25(x), r1=80(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=66(x1), r1=114(y1), r2=189(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (25, 80) with radius 17.
; PLAN: r0=25(x), r1=80(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 80
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (66, 114) to (189, 127).
; PLAN: r0=66(x1), r1=114(y1), r2=189(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 114
LDI r2, 189
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
