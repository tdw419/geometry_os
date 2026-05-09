; DESCRIPTION: Composite: . Then Draws a green line from (81, 114) to (193, 228). Then Places a yellow dot at position (85, 1).
; PLAN: r0=81(x1), r1=114(y1), r2=193(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=85(x), r1=1(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green line from (81, 114) to (193, 228).
; PLAN: r0=81(x1), r1=114(y1), r2=193(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 114
LDI r2, 193
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (85, 1).
; PLAN: r0=85(x), r1=1(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 1
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
