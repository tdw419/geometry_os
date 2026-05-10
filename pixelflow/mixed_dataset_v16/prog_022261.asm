; DESCRIPTION: Composite: Places a magenta line segment connecting (196, 97) to (479, 2) then Sets a single cyan pixel at (317, 247) then Places a yellow circle of radius 77 at center (141, 113).
; PLAN: r0=196(x1), r1=97(y1), r2=479(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=247(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=141(x), r11=113(y), r12=77(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 196
LDI r1, 97
LDI r2, 479
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 247
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 141
LDI r11, 113
LDI r12, 77
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
