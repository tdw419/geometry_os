; DESCRIPTION: Composite: . Then Places a black dot at position (238, 209). Then Places a red line segment connecting (144, 211) to (38, 197).
; PLAN: r0=238(x), r1=209(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=144(x1), r1=211(y1), r2=38(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (238, 209).
; PLAN: r0=238(x), r1=209(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 209
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a red line segment connecting (144, 211) to (38, 197).
; PLAN: r0=144(x1), r1=211(y1), r2=38(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 211
LDI r2, 38
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
