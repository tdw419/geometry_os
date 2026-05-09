; DESCRIPTION: Composite: . Then Draws a orange line from (172, 151) to (245, 159). Then Places a green circle of radius 43 at center (54, 166).
; PLAN: r0=172(x1), r1=151(y1), r2=245(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=54(x), r1=166(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange line from (172, 151) to (245, 159).
; PLAN: r0=172(x1), r1=151(y1), r2=245(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 151
LDI r2, 245
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 43 at center (54, 166).
; PLAN: r0=54(x), r1=166(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 166
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
