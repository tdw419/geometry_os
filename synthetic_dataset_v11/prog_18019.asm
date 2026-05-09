; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (97, 29) to (39, 164). Then Places a white dot at position (150, 155).
; PLAN: r0=97(x1), r1=29(y1), r2=39(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=150(x), r1=155(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (97, 29) to (39, 164).
; PLAN: r0=97(x1), r1=29(y1), r2=39(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 29
LDI r2, 39
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (150, 155).
; PLAN: r0=150(x), r1=155(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 155
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
