; DESCRIPTION: Composite: Draws a green line from (35, 222) to (210, 9) then Places a purple dot at position (154, 195).
; PLAN: r0=35(x1), r1=222(y1), r2=210(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=195(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 35
LDI r1, 222
LDI r2, 210
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 195
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
