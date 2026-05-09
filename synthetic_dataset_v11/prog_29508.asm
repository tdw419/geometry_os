; DESCRIPTION: Composite: . Then Draws a green line from (17, 195) to (133, 29). Then Places a magenta dot at position (150, 116).
; PLAN: r0=17(x1), r1=195(y1), r2=133(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=150(x), r1=116(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green line from (17, 195) to (133, 29).
; PLAN: r0=17(x1), r1=195(y1), r2=133(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 195
LDI r2, 133
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (150, 116).
; PLAN: r0=150(x), r1=116(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 116
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
