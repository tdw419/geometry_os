; DESCRIPTION: Composite: Draws a purple line from (90, 230) to (277, 58) then Places a magenta dot at position (413, 59).
; PLAN: r0=90(x1), r1=230(y1), r2=277(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=59(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 230
LDI r2, 277
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 59
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
