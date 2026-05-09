; DESCRIPTION: Composite: . Then Places a magenta dot at position (72, 12). Then Draws a green line from (134, 37) to (157, 251).
; PLAN: r0=72(x), r1=12(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=134(x1), r1=37(y1), r2=157(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (72, 12).
; PLAN: r0=72(x), r1=12(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 12
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a green line from (134, 37) to (157, 251).
; PLAN: r0=134(x1), r1=37(y1), r2=157(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 37
LDI r2, 157
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
