; DESCRIPTION: Composite: . Then Draws a white line from (143, 16) to (18, 102). Then Draws a black circle centered at (166, 125) with radius 65.
; PLAN: r0=143(x1), r1=16(y1), r2=18(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=166(x), r1=125(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (143, 16) to (18, 102).
; PLAN: r0=143(x1), r1=16(y1), r2=18(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 16
LDI r2, 18
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (166, 125) with radius 65.
; PLAN: r0=166(x), r1=125(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 125
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
