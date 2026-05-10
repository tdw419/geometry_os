; DESCRIPTION: Composite: Places a black line segment connecting (480, 216) to (340, 253) then Places a magenta dot at position (127, 13).
; PLAN: r0=480(x1), r1=216(y1), r2=340(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=127(x), r6=13(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 480
LDI r1, 216
LDI r2, 340
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 13
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
