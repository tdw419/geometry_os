; DESCRIPTION: Composite: Places a yellow 50x18 rectangle at position (296, 216) then Sets a single magenta pixel at (388, 223).
; PLAN: r0=296(x), r1=216(y), r2=50(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=223(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 296
LDI r1, 216
LDI r2, 50
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 223
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
