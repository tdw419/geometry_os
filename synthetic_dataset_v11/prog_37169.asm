; DESCRIPTION: Composite: . Then Places a green dot at position (170, 29). Then Renders a red line between points (60, 238) and (126, 32).
; PLAN: r0=170(x), r1=29(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=60(x1), r1=238(y1), r2=126(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (170, 29).
; PLAN: r0=170(x), r1=29(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 29
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (60, 238) and (126, 32).
; PLAN: r0=60(x1), r1=238(y1), r2=126(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 238
LDI r2, 126
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
