; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (154, 135) with radius 57. Then Renders a black line between points (86, 94) and (53, 117).
; PLAN: r0=154(x), r1=135(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=86(x1), r1=94(y1), r2=53(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (154, 135) with radius 57.
; PLAN: r0=154(x), r1=135(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 135
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (86, 94) and (53, 117).
; PLAN: r0=86(x1), r1=94(y1), r2=53(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 94
LDI r2, 53
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
