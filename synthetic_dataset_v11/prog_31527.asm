; DESCRIPTION: Composite: . Then Draws a green line from (177, 80) to (119, 68). Then Places a white circle of radius 65 at center (173, 134).
; PLAN: r0=177(x1), r1=80(y1), r2=119(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=173(x), r1=134(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (177, 80) to (119, 68).
; PLAN: r0=177(x1), r1=80(y1), r2=119(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 80
LDI r2, 119
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 65 at center (173, 134).
; PLAN: r0=173(x), r1=134(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 134
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
