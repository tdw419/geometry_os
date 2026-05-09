; DESCRIPTION: Composite: . Then Places a cyan dot at position (63, 8). Then Places a blue line segment connecting (239, 121) to (144, 159).
; PLAN: r0=63(x), r1=8(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=239(x1), r1=121(y1), r2=144(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (63, 8).
; PLAN: r0=63(x), r1=8(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 8
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a blue line segment connecting (239, 121) to (144, 159).
; PLAN: r0=239(x1), r1=121(y1), r2=144(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 121
LDI r2, 144
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
