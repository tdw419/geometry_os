; DESCRIPTION: Composite: . Then Draws a green line from (239, 84) to (47, 255). Then Places a red dot at position (217, 116).
; PLAN: r0=239(x1), r1=84(y1), r2=47(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=217(x), r1=116(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green line from (239, 84) to (47, 255).
; PLAN: r0=239(x1), r1=84(y1), r2=47(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 84
LDI r2, 47
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (217, 116).
; PLAN: r0=217(x), r1=116(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 116
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
