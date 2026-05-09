; DESCRIPTION: Composite: Draws a magenta line from (25, 255) to (454, 196) then Places a black dot at position (115, 231).
; PLAN: r0=25(x1), r1=255(y1), r2=454(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=231(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 25
LDI r1, 255
LDI r2, 454
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 231
LDI r7, 0x000000
PSET r5, r6, r7
HALT
