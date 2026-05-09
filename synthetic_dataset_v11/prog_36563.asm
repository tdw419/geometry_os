; DESCRIPTION: Composite: . Then Places a green 93x116 rectangle at position (139, 54). Then Draws a yellow circle centered at (179, 71) with radius 22.
; PLAN: r0=139(x), r1=54(y), r2=93(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=179(x), r1=71(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green 93x116 rectangle at position (139, 54).
; PLAN: r0=139(x), r1=54(y), r2=93(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 54
LDI r2, 93
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (179, 71) with radius 22.
; PLAN: r0=179(x), r1=71(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 71
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
