; DESCRIPTION: Composite: . Then Places a green dot at position (229, 24). Then Renders a yellow line between points (213, 178) and (26, 55).
; PLAN: r0=229(x), r1=24(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=213(x1), r1=178(y1), r2=26(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (229, 24).
; PLAN: r0=229(x), r1=24(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 24
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow line between points (213, 178) and (26, 55).
; PLAN: r0=213(x1), r1=178(y1), r2=26(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 178
LDI r2, 26
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
