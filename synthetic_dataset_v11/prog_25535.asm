; DESCRIPTION: Composite: . Then Renders a white line between points (184, 39) and (183, 93). Then Places a yellow dot at position (168, 160).
; PLAN: r0=184(x1), r1=39(y1), r2=183(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=168(x), r1=160(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white line between points (184, 39) and (183, 93).
; PLAN: r0=184(x1), r1=39(y1), r2=183(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 39
LDI r2, 183
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (168, 160).
; PLAN: r0=168(x), r1=160(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 160
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
