; DESCRIPTION: Composite: . Then Renders a yellow box of size 12x75 starting at (74, 57). Then Places a blue dot at position (147, 1).
; PLAN: r0=74(x), r1=57(y), r2=12(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=147(x), r1=1(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow box of size 12x75 starting at (74, 57).
; PLAN: r0=74(x), r1=57(y), r2=12(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 57
LDI r2, 12
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (147, 1).
; PLAN: r0=147(x), r1=1(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 1
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
