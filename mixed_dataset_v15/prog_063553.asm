; DESCRIPTION: Composite: Places a green dot at position (173, 166) then Places a magenta circle of radius 43 at center (80, 132).
; PLAN: r0=173(x), r1=166(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=132(y), r7=43(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 173
LDI r1, 166
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 80
LDI r6, 132
LDI r7, 43
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
