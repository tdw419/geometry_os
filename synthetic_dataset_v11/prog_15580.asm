; DESCRIPTION: Composite: . Then Renders a cyan line between points (115, 19) and (164, 223). Then Places a purple dot at position (245, 174).
; PLAN: r0=115(x1), r1=19(y1), r2=164(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=245(x), r1=174(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan line between points (115, 19) and (164, 223).
; PLAN: r0=115(x1), r1=19(y1), r2=164(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 19
LDI r2, 164
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (245, 174).
; PLAN: r0=245(x), r1=174(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 174
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
