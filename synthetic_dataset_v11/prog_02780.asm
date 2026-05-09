; DESCRIPTION: Composite: . Then Places a black dot at position (186, 39). Then Places a yellow line segment connecting (237, 111) to (242, 250).
; PLAN: r0=186(x), r1=39(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=237(x1), r1=111(y1), r2=242(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (186, 39).
; PLAN: r0=186(x), r1=39(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 39
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (237, 111) to (242, 250).
; PLAN: r0=237(x1), r1=111(y1), r2=242(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 111
LDI r2, 242
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
