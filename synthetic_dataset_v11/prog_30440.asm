; DESCRIPTION: Composite: . Then Places a yellow circle of radius 19 at center (153, 233). Then Places a red 118x65 rectangle at position (86, 109).
; PLAN: r0=153(x), r1=233(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=86(x), r1=109(y), r2=118(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 19 at center (153, 233).
; PLAN: r0=153(x), r1=233(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 233
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 118x65 rectangle at position (86, 109).
; PLAN: r0=86(x), r1=109(y), r2=118(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 109
LDI r2, 118
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
