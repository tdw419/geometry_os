; DESCRIPTION: Composite: . Then Places a black dot at position (54, 213). Then Places a green line segment connecting (114, 38) to (164, 159).
; PLAN: r0=54(x), r1=213(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=114(x1), r1=38(y1), r2=164(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (54, 213).
; PLAN: r0=54(x), r1=213(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 213
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a green line segment connecting (114, 38) to (164, 159).
; PLAN: r0=114(x1), r1=38(y1), r2=164(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 38
LDI r2, 164
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
