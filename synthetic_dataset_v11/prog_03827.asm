; DESCRIPTION: Composite: . Then Draws a red line from (150, 143) to (63, 101). Then Places a yellow circle of radius 42 at center (118, 62).
; PLAN: r0=150(x1), r1=143(y1), r2=63(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=118(x), r1=62(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red line from (150, 143) to (63, 101).
; PLAN: r0=150(x1), r1=143(y1), r2=63(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 143
LDI r2, 63
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 42 at center (118, 62).
; PLAN: r0=118(x), r1=62(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 62
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
