; DESCRIPTION: Composite: . Then Places a green dot at position (57, 102). Then Places a yellow line segment connecting (174, 128) to (184, 128).
; PLAN: r0=57(x), r1=102(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=174(x1), r1=128(y1), r2=184(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (57, 102).
; PLAN: r0=57(x), r1=102(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 102
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (174, 128) to (184, 128).
; PLAN: r0=174(x1), r1=128(y1), r2=184(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 128
LDI r2, 184
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
