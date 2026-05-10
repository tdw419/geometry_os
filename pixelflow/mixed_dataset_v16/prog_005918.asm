; DESCRIPTION: Composite: Draws a black line from (121, 186) to (412, 148) then Places a blue dot at position (422, 243).
; PLAN: r0=121(x1), r1=186(y1), r2=412(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=243(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 121
LDI r1, 186
LDI r2, 412
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 243
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
