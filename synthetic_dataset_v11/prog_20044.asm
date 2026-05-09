; DESCRIPTION: Composite: . Then Places a magenta dot at position (202, 62). Then Draws a magenta line from (241, 156) to (118, 248).
; PLAN: r0=202(x), r1=62(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=241(x1), r1=156(y1), r2=118(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (202, 62).
; PLAN: r0=202(x), r1=62(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 62
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta line from (241, 156) to (118, 248).
; PLAN: r0=241(x1), r1=156(y1), r2=118(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 156
LDI r2, 118
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
