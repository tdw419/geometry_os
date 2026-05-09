; DESCRIPTION: Composite: . Then Renders a yellow line between points (77, 131) and (196, 252). Then Places a red dot at position (231, 27).
; PLAN: r0=77(x1), r1=131(y1), r2=196(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=231(x), r1=27(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow line between points (77, 131) and (196, 252).
; PLAN: r0=77(x1), r1=131(y1), r2=196(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 131
LDI r2, 196
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (231, 27).
; PLAN: r0=231(x), r1=27(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 27
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
