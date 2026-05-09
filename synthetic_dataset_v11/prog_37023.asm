; DESCRIPTION: Composite: . Then Places a magenta dot at position (156, 48). Then Draws a cyan line from (17, 113) to (171, 239).
; PLAN: r0=156(x), r1=48(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=17(x1), r1=113(y1), r2=171(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (156, 48).
; PLAN: r0=156(x), r1=48(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 48
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (17, 113) to (171, 239).
; PLAN: r0=17(x1), r1=113(y1), r2=171(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 113
LDI r2, 171
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
