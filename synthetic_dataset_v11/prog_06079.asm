; DESCRIPTION: Composite: . Then Places a red dot at position (179, 231). Then Renders a orange line between points (133, 202) and (30, 228).
; PLAN: r0=179(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=133(x1), r1=202(y1), r2=30(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (179, 231).
; PLAN: r0=179(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 231
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a orange line between points (133, 202) and (30, 228).
; PLAN: r0=133(x1), r1=202(y1), r2=30(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 202
LDI r2, 30
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
