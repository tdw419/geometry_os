; DESCRIPTION: Composite: . Then Renders a yellow line between points (27, 67) and (32, 63). Then Sets a single red pixel at (247, 109).
; PLAN: r0=27(x1), r1=67(y1), r2=32(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=247(x), r1=109(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow line between points (27, 67) and (32, 63).
; PLAN: r0=27(x1), r1=67(y1), r2=32(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 67
LDI r2, 32
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (247, 109).
; PLAN: r0=247(x), r1=109(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 109
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
