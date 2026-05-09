; DESCRIPTION: Composite: . Then Renders a yellow line between points (107, 162) and (131, 115). Then Creates a magenta rectangular region at (151, 21) spanning 31 by 63 pixels.
; PLAN: r0=107(x1), r1=162(y1), r2=131(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=151(x), r1=21(y), r2=31(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (107, 162) and (131, 115).
; PLAN: r0=107(x1), r1=162(y1), r2=131(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 162
LDI r2, 131
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta rectangular region at (151, 21) spanning 31 by 63 pixels.
; PLAN: r0=151(x), r1=21(y), r2=31(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 21
LDI r2, 31
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
