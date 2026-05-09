; DESCRIPTION: Composite: . Then Renders a yellow line between points (221, 41) and (42, 229). Then Places a green dot at position (171, 236).
; PLAN: r0=221(x1), r1=41(y1), r2=42(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=171(x), r1=236(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow line between points (221, 41) and (42, 229).
; PLAN: r0=221(x1), r1=41(y1), r2=42(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 41
LDI r2, 42
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (171, 236).
; PLAN: r0=171(x), r1=236(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 236
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
