; DESCRIPTION: Composite: . Then Places a white dot at position (104, 165). Then Draws a black line from (141, 90) to (187, 249).
; PLAN: r0=104(x), r1=165(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=141(x1), r1=90(y1), r2=187(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (104, 165).
; PLAN: r0=104(x), r1=165(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 165
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (141, 90) to (187, 249).
; PLAN: r0=141(x1), r1=90(y1), r2=187(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 90
LDI r2, 187
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
