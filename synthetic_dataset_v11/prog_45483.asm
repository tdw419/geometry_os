; DESCRIPTION: Composite: . Then Draws a red circle centered at (60, 81) with radius 55. Then Renders a yellow line between points (60, 210) and (25, 236).
; PLAN: r0=60(x), r1=81(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=60(x1), r1=210(y1), r2=25(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (60, 81) with radius 55.
; PLAN: r0=60(x), r1=81(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 81
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow line between points (60, 210) and (25, 236).
; PLAN: r0=60(x1), r1=210(y1), r2=25(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 210
LDI r2, 25
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
