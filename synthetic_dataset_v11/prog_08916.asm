; DESCRIPTION: Composite: . Then Renders a magenta line between points (3, 93) and (37, 151). Then Draws a cyan circle centered at (50, 163) with radius 48.
; PLAN: r0=3(x1), r1=93(y1), r2=37(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=50(x), r1=163(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta line between points (3, 93) and (37, 151).
; PLAN: r0=3(x1), r1=93(y1), r2=37(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 93
LDI r2, 37
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan circle centered at (50, 163) with radius 48.
; PLAN: r0=50(x), r1=163(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 163
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
