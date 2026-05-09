; DESCRIPTION: Composite: . Then Renders a blue line between points (25, 110) and (82, 82). Then Places a magenta dot at position (12, 42).
; PLAN: r0=25(x1), r1=110(y1), r2=82(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=12(x), r1=42(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (25, 110) and (82, 82).
; PLAN: r0=25(x1), r1=110(y1), r2=82(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 110
LDI r2, 82
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (12, 42).
; PLAN: r0=12(x), r1=42(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 42
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
