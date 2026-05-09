; DESCRIPTION: Composite: . Then Places a red dot at position (128, 246). Then Renders a red line between points (136, 111) and (180, 117).
; PLAN: r0=128(x), r1=246(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=136(x1), r1=111(y1), r2=180(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (128, 246).
; PLAN: r0=128(x), r1=246(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 246
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (136, 111) and (180, 117).
; PLAN: r0=136(x1), r1=111(y1), r2=180(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 111
LDI r2, 180
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
