; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (27, 39) to (181, 67). Then Places a blue dot at position (148, 111).
; PLAN: r0=27(x1), r1=39(y1), r2=181(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=148(x), r1=111(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (27, 39) to (181, 67).
; PLAN: r0=27(x1), r1=39(y1), r2=181(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 39
LDI r2, 181
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (148, 111).
; PLAN: r0=148(x), r1=111(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 111
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
