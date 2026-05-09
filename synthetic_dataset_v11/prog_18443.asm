; DESCRIPTION: Composite: . Then Places a black circle of radius 78 at center (161, 93). Then Draws a white line from (247, 0) to (243, 125).
; PLAN: r0=161(x), r1=93(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=247(x1), r1=0(y1), r2=243(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 78 at center (161, 93).
; PLAN: r0=161(x), r1=93(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 93
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (247, 0) to (243, 125).
; PLAN: r0=247(x1), r1=0(y1), r2=243(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 0
LDI r2, 243
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
