; DESCRIPTION: Composite: . Then Places a green line segment connecting (44, 72) to (70, 243). Then Places a cyan dot at position (99, 189).
; PLAN: r0=44(x1), r1=72(y1), r2=70(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=99(x), r1=189(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (44, 72) to (70, 243).
; PLAN: r0=44(x1), r1=72(y1), r2=70(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 72
LDI r2, 70
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (99, 189).
; PLAN: r0=99(x), r1=189(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 189
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
