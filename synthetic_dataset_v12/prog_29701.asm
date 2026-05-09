; DESCRIPTION: Composite: Draws a black rectangle at (21, 89) with width 66 and height 44 then Sets a single magenta pixel at (73, 146).
; PLAN: r0=21(x), r1=89(y), r2=66(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=146(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 21
LDI r1, 89
LDI r2, 66
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 146
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
