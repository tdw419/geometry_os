; DESCRIPTION: Composite: Places a green dot at position (232, 173) then Places a magenta circle of radius 80 at center (221, 91).
; PLAN: r0=232(x), r1=173(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=91(y), r7=80(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 232
LDI r1, 173
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 221
LDI r6, 91
LDI r7, 80
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
