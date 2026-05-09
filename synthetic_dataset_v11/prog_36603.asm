; DESCRIPTION: Composite: . Then Places a cyan dot at position (82, 10). Then Renders a purple line between points (77, 171) and (156, 113).
; PLAN: r0=82(x), r1=10(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=77(x1), r1=171(y1), r2=156(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (82, 10).
; PLAN: r0=82(x), r1=10(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 10
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple line between points (77, 171) and (156, 113).
; PLAN: r0=77(x1), r1=171(y1), r2=156(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 171
LDI r2, 156
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
