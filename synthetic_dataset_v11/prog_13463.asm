; DESCRIPTION: Composite: . Then Draws a green line from (134, 78) to (7, 46). Then Places a purple dot at position (82, 59).
; PLAN: r0=134(x1), r1=78(y1), r2=7(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=82(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green line from (134, 78) to (7, 46).
; PLAN: r0=134(x1), r1=78(y1), r2=7(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 78
LDI r2, 7
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (82, 59).
; PLAN: r0=82(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 59
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
