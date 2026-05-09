; DESCRIPTION: Composite: . Then Places a yellow dot at position (7, 68). Then Renders a red line between points (121, 45) and (206, 29).
; PLAN: r0=7(x), r1=68(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=121(x1), r1=45(y1), r2=206(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (7, 68).
; PLAN: r0=7(x), r1=68(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 7
LDI r1, 68
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (121, 45) and (206, 29).
; PLAN: r0=121(x1), r1=45(y1), r2=206(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 45
LDI r2, 206
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
