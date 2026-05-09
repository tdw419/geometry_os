; DESCRIPTION: Composite: Creates a blue circular shape at (337, 177) with radius 53 then Draws a cyan line from (461, 23) to (209, 207) then Places a purple dot at position (429, 225).
; PLAN: r0=337(x), r1=177(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x1), r6=23(y1), r7=209(x2), r8=207(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=429(x), r11=225(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 177
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 23
LDI r7, 209
LDI r8, 207
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 225
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
