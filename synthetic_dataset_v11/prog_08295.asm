; DESCRIPTION: Composite: . Then Places a purple dot at position (27, 59). Then Places a black line segment connecting (86, 206) to (144, 255).
; PLAN: r0=27(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=86(x1), r1=206(y1), r2=144(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (27, 59).
; PLAN: r0=27(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 59
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (86, 206) to (144, 255).
; PLAN: r0=86(x1), r1=206(y1), r2=144(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 206
LDI r2, 144
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
