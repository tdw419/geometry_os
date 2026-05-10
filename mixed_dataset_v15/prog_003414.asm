; DESCRIPTION: Composite: Draws a blue line from (29, 216) to (32, 197) then Places a green dot at position (345, 146).
; PLAN: r0=29(x1), r1=216(y1), r2=32(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=146(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 29
LDI r1, 216
LDI r2, 32
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 146
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
