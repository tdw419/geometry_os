; DESCRIPTION: Composite: . Then Draws a blue line from (86, 130) to (150, 190). Then Places a yellow dot at position (48, 116).
; PLAN: r0=86(x1), r1=130(y1), r2=150(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=48(x), r1=116(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue line from (86, 130) to (150, 190).
; PLAN: r0=86(x1), r1=130(y1), r2=150(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 130
LDI r2, 150
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (48, 116).
; PLAN: r0=48(x), r1=116(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 116
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
