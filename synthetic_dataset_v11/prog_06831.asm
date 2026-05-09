; DESCRIPTION: Composite: . Then Draws a yellow line from (208, 82) to (206, 55). Then Places a yellow dot at position (45, 73).
; PLAN: r0=208(x1), r1=82(y1), r2=206(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=45(x), r1=73(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow line from (208, 82) to (206, 55).
; PLAN: r0=208(x1), r1=82(y1), r2=206(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 82
LDI r2, 206
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (45, 73).
; PLAN: r0=45(x), r1=73(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 73
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
