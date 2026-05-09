; DESCRIPTION: Composite: . Then Places a green line segment connecting (116, 47) to (230, 130). Then Sets a single black pixel at (161, 108).
; PLAN: r0=116(x1), r1=47(y1), r2=230(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=161(x), r1=108(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (116, 47) to (230, 130).
; PLAN: r0=116(x1), r1=47(y1), r2=230(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 47
LDI r2, 230
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (161, 108).
; PLAN: r0=161(x), r1=108(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 108
LDI r2, 0x000000
PSET r0, r1, r2
HALT
