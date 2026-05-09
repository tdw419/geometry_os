; DESCRIPTION: Composite: . Then Draws a yellow line from (188, 108) to (76, 33). Then Places a black dot at position (44, 95).
; PLAN: r0=188(x1), r1=108(y1), r2=76(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=44(x), r1=95(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow line from (188, 108) to (76, 33).
; PLAN: r0=188(x1), r1=108(y1), r2=76(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 108
LDI r2, 76
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (44, 95).
; PLAN: r0=44(x), r1=95(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 95
LDI r2, 0x000000
PSET r0, r1, r2
HALT
