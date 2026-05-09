; DESCRIPTION: Composite: . Then Draws a white line from (35, 146) to (37, 219). Then Draws a red circle centered at (150, 127) with radius 13.
; PLAN: r0=35(x1), r1=146(y1), r2=37(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=150(x), r1=127(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (35, 146) to (37, 219).
; PLAN: r0=35(x1), r1=146(y1), r2=37(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 146
LDI r2, 37
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (150, 127) with radius 13.
; PLAN: r0=150(x), r1=127(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 127
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
