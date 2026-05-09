; DESCRIPTION: Composite: . Then Draws a yellow line from (135, 142) to (101, 62). Then Sets a single magenta pixel at (165, 107).
; PLAN: r0=135(x1), r1=142(y1), r2=101(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=165(x), r1=107(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow line from (135, 142) to (101, 62).
; PLAN: r0=135(x1), r1=142(y1), r2=101(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 142
LDI r2, 101
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (165, 107).
; PLAN: r0=165(x), r1=107(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 107
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
