; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (148, 107) to (45, 39). Then Places a black dot at position (206, 228).
; PLAN: r0=148(x1), r1=107(y1), r2=45(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=206(x), r1=228(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (148, 107) to (45, 39).
; PLAN: r0=148(x1), r1=107(y1), r2=45(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 107
LDI r2, 45
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (206, 228).
; PLAN: r0=206(x), r1=228(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 206
LDI r1, 228
LDI r2, 0x000000
PSET r0, r1, r2
HALT
