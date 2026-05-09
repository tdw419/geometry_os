; DESCRIPTION: Composite: . Then Sets a single blue pixel at (227, 57). Then Renders a yellow line between points (59, 186) and (236, 174).
; PLAN: r0=227(x), r1=57(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=59(x1), r1=186(y1), r2=236(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (227, 57).
; PLAN: r0=227(x), r1=57(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 227
LDI r1, 57
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow line between points (59, 186) and (236, 174).
; PLAN: r0=59(x1), r1=186(y1), r2=236(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 186
LDI r2, 236
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
