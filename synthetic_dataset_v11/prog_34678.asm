; DESCRIPTION: Composite: . Then Renders a cyan line between points (101, 22) and (66, 225). Then Places a cyan dot at position (243, 53).
; PLAN: r0=101(x1), r1=22(y1), r2=66(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=243(x), r1=53(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan line between points (101, 22) and (66, 225).
; PLAN: r0=101(x1), r1=22(y1), r2=66(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 22
LDI r2, 66
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (243, 53).
; PLAN: r0=243(x), r1=53(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 243
LDI r1, 53
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
