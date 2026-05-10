; DESCRIPTION: Composite: Draws a black line from (307, 43) to (319, 121) then Places a white circle of radius 13 at center (113, 93).
; PLAN: r0=307(x1), r1=43(y1), r2=319(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=93(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 307
LDI r1, 43
LDI r2, 319
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 93
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
