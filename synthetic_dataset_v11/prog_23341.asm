; DESCRIPTION: Composite: . Then Renders a black line between points (12, 236) and (210, 209). Then Places a white dot at position (230, 33).
; PLAN: r0=12(x1), r1=236(y1), r2=210(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=230(x), r1=33(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (12, 236) and (210, 209).
; PLAN: r0=12(x1), r1=236(y1), r2=210(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 236
LDI r2, 210
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (230, 33).
; PLAN: r0=230(x), r1=33(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 230
LDI r1, 33
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
