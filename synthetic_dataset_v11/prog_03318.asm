; DESCRIPTION: Composite: . Then Places a black dot at position (238, 115). Then Renders a cyan line between points (191, 226) and (175, 235).
; PLAN: r0=238(x), r1=115(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=191(x1), r1=226(y1), r2=175(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (238, 115).
; PLAN: r0=238(x), r1=115(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 115
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan line between points (191, 226) and (175, 235).
; PLAN: r0=191(x1), r1=226(y1), r2=175(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 226
LDI r2, 175
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
