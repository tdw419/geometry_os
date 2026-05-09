; DESCRIPTION: Composite: . Then Places a black dot at position (169, 27). Then Renders a white line between points (57, 0) and (249, 160).
; PLAN: r0=169(x), r1=27(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=57(x1), r1=0(y1), r2=249(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (169, 27).
; PLAN: r0=169(x), r1=27(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 27
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a white line between points (57, 0) and (249, 160).
; PLAN: r0=57(x1), r1=0(y1), r2=249(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 0
LDI r2, 249
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
