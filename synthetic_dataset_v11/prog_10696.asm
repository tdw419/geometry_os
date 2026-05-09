; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (164, 205) to (202, 241). Then Places a yellow dot at position (180, 232).
; PLAN: r0=164(x1), r1=205(y1), r2=202(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=180(x), r1=232(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (164, 205) to (202, 241).
; PLAN: r0=164(x1), r1=205(y1), r2=202(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 205
LDI r2, 202
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (180, 232).
; PLAN: r0=180(x), r1=232(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 232
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
