; DESCRIPTION: Composite: . Then Places a cyan dot at position (50, 90). Then Places a yellow line segment connecting (24, 60) to (98, 243).
; PLAN: r0=50(x), r1=90(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=24(x1), r1=60(y1), r2=98(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (50, 90).
; PLAN: r0=50(x), r1=90(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 90
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (24, 60) to (98, 243).
; PLAN: r0=24(x1), r1=60(y1), r2=98(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 60
LDI r2, 98
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
