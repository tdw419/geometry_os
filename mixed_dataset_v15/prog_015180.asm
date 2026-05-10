; DESCRIPTION: Composite: Places a cyan circle of radius 29 at center (307, 119) then Renders a orange line between points (233, 210) and (285, 166) then Places a magenta dot at position (340, 223).
; PLAN: r0=307(x), r1=119(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=233(x1), r6=210(y1), r7=285(x2), r8=166(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=340(x), r11=223(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 307
LDI r1, 119
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 233
LDI r6, 210
LDI r7, 285
LDI r8, 166
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 223
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
