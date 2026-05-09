; DESCRIPTION: Composite: . Then Draws a magenta line from (193, 8) to (95, 91). Then Places a cyan circle of radius 29 at center (69, 129).
; PLAN: r0=193(x1), r1=8(y1), r2=95(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=69(x), r1=129(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta line from (193, 8) to (95, 91).
; PLAN: r0=193(x1), r1=8(y1), r2=95(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 8
LDI r2, 95
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 29 at center (69, 129).
; PLAN: r0=69(x), r1=129(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 129
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
