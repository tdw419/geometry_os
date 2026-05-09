; DESCRIPTION: Composite: Draws a magenta circle centered at (436, 215) with radius 19 then Draws a yellow line from (449, 197) to (363, 113).
; PLAN: r0=436(x), r1=215(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x1), r6=197(y1), r7=363(x2), r8=113(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 215
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 197
LDI r7, 363
LDI r8, 113
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
