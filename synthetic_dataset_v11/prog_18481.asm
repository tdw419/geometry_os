; DESCRIPTION: Composite: . Then Renders a black line between points (146, 28) and (4, 254). Then Places a yellow circle of radius 39 at center (207, 125).
; PLAN: r0=146(x1), r1=28(y1), r2=4(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=207(x), r1=125(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (146, 28) and (4, 254).
; PLAN: r0=146(x1), r1=28(y1), r2=4(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 28
LDI r2, 4
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 39 at center (207, 125).
; PLAN: r0=207(x), r1=125(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 125
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
