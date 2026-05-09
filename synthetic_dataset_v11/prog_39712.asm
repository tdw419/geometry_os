; DESCRIPTION: Composite: . Then Places a white dot at position (72, 0). Then Renders a black line between points (13, 247) and (0, 68).
; PLAN: r0=72(x), r1=0(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=13(x1), r1=247(y1), r2=0(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (72, 0).
; PLAN: r0=72(x), r1=0(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 0
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a black line between points (13, 247) and (0, 68).
; PLAN: r0=13(x1), r1=247(y1), r2=0(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 247
LDI r2, 0
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
