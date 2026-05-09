; DESCRIPTION: Composite: . Then Draws a blue circle centered at (69, 177) with radius 68. Then Draws a white line from (196, 29) to (138, 226).
; PLAN: r0=69(x), r1=177(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=196(x1), r1=29(y1), r2=138(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (69, 177) with radius 68.
; PLAN: r0=69(x), r1=177(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 177
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (196, 29) to (138, 226).
; PLAN: r0=196(x1), r1=29(y1), r2=138(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 29
LDI r2, 138
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
