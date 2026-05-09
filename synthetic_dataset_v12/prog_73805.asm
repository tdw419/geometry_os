; DESCRIPTION: Composite: Draws a blue line from (279, 54) to (320, 26) then Places a red dot at position (254, 125).
; PLAN: r0=279(x1), r1=54(y1), r2=320(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=125(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 279
LDI r1, 54
LDI r2, 320
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 125
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
