; DESCRIPTION: Composite: . Then Renders a red line between points (213, 214) and (68, 76). Then Places a green dot at position (43, 221).
; PLAN: r0=213(x1), r1=214(y1), r2=68(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=43(x), r1=221(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red line between points (213, 214) and (68, 76).
; PLAN: r0=213(x1), r1=214(y1), r2=68(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 214
LDI r2, 68
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (43, 221).
; PLAN: r0=43(x), r1=221(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 221
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
