; DESCRIPTION: Composite: Places a magenta circle of radius 14 at center (260, 81) then Renders a purple box of size 51x77 starting at (354, 52).
; PLAN: r0=260(x), r1=81(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x), r6=52(y), r7=51(width), r8=77(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 81
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 52
LDI r7, 51
LDI r8, 77
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
