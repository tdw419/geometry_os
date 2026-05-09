; DESCRIPTION: Composite: . Then Places a white dot at position (158, 175). Then Renders a blue line between points (154, 15) and (202, 55).
; PLAN: r0=158(x), r1=175(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=154(x1), r1=15(y1), r2=202(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (158, 175).
; PLAN: r0=158(x), r1=175(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 175
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (154, 15) and (202, 55).
; PLAN: r0=154(x1), r1=15(y1), r2=202(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 15
LDI r2, 202
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
