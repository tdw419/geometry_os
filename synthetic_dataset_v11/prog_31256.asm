; DESCRIPTION: Composite: . Then Draws a green line from (113, 97) to (240, 122). Then Creates a red circular shape at (107, 89) with radius 29.
; PLAN: r0=113(x1), r1=97(y1), r2=240(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=107(x), r1=89(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (113, 97) to (240, 122).
; PLAN: r0=113(x1), r1=97(y1), r2=240(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 97
LDI r2, 240
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (107, 89) with radius 29.
; PLAN: r0=107(x), r1=89(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 89
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
