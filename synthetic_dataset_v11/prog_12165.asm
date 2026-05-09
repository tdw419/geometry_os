; DESCRIPTION: Composite: . Then Places a green 31x65 rectangle at position (126, 110). Then Renders a magenta line between points (42, 131) and (205, 118).
; PLAN: r0=126(x), r1=110(y), r2=31(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=42(x1), r1=131(y1), r2=205(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green 31x65 rectangle at position (126, 110).
; PLAN: r0=126(x), r1=110(y), r2=31(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 110
LDI r2, 31
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (42, 131) and (205, 118).
; PLAN: r0=42(x1), r1=131(y1), r2=205(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 131
LDI r2, 205
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
