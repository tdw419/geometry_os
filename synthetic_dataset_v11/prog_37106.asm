; DESCRIPTION: Composite: . Then Sets a single black pixel at (8, 146). Then Draws a cyan line from (62, 43) to (141, 169).
; PLAN: r0=8(x), r1=146(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=62(x1), r1=43(y1), r2=141(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (8, 146).
; PLAN: r0=8(x), r1=146(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 146
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (62, 43) to (141, 169).
; PLAN: r0=62(x1), r1=43(y1), r2=141(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 43
LDI r2, 141
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
