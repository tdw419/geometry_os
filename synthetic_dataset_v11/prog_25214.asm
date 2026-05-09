; DESCRIPTION: Composite: . Then Draws a white circle centered at (84, 194) with radius 60. Then Renders a cyan line between points (39, 101) and (222, 42).
; PLAN: r0=84(x), r1=194(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=39(x1), r1=101(y1), r2=222(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (84, 194) with radius 60.
; PLAN: r0=84(x), r1=194(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 194
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (39, 101) and (222, 42).
; PLAN: r0=39(x1), r1=101(y1), r2=222(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 101
LDI r2, 222
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
