; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (186, 168) with radius 65. Then Places a magenta line segment connecting (236, 134) to (193, 107).
; PLAN: r0=186(x), r1=168(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=236(x1), r1=134(y1), r2=193(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (186, 168) with radius 65.
; PLAN: r0=186(x), r1=168(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 168
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta line segment connecting (236, 134) to (193, 107).
; PLAN: r0=236(x1), r1=134(y1), r2=193(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 134
LDI r2, 193
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
