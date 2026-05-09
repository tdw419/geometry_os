; DESCRIPTION: Composite: Draws a green line from (327, 228) to (196, 97) then Creates a green circular shape at (86, 120) with radius 69 then Sets a single magenta pixel at (27, 209).
; PLAN: r0=327(x1), r1=228(y1), r2=196(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=120(y), r7=69(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=27(x), r11=209(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 327
LDI r1, 228
LDI r2, 196
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 120
LDI r7, 69
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 27
LDI r11, 209
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
