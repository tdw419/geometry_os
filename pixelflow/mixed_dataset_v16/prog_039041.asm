; DESCRIPTION: Composite: Draws a blue line from (264, 16) to (482, 202) then Places a blue dot at position (362, 100).
; PLAN: r0=264(x1), r1=16(y1), r2=482(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=100(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 264
LDI r1, 16
LDI r2, 482
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 100
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
