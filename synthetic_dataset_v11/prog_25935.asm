; DESCRIPTION: Composite: . Then Places a red dot at position (216, 148). Then Renders a green line between points (160, 48) and (121, 236).
; PLAN: r0=216(x), r1=148(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=160(x1), r1=48(y1), r2=121(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (216, 148).
; PLAN: r0=216(x), r1=148(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 148
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a green line between points (160, 48) and (121, 236).
; PLAN: r0=160(x1), r1=48(y1), r2=121(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 48
LDI r2, 121
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
