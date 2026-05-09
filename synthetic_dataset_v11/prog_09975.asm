; DESCRIPTION: Composite: . Then Renders a cyan line between points (53, 33) and (218, 242). Then Places a yellow dot at position (122, 122).
; PLAN: r0=53(x1), r1=33(y1), r2=218(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=122(x), r1=122(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan line between points (53, 33) and (218, 242).
; PLAN: r0=53(x1), r1=33(y1), r2=218(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 33
LDI r2, 218
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (122, 122).
; PLAN: r0=122(x), r1=122(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 122
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
