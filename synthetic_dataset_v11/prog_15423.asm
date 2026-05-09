; DESCRIPTION: Composite: . Then Places a green dot at position (12, 89). Then Draws a magenta line from (84, 55) to (238, 31).
; PLAN: r0=12(x), r1=89(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=84(x1), r1=55(y1), r2=238(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (12, 89).
; PLAN: r0=12(x), r1=89(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 89
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta line from (84, 55) to (238, 31).
; PLAN: r0=84(x1), r1=55(y1), r2=238(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 55
LDI r2, 238
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
