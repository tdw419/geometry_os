; DESCRIPTION: Composite: Draws a black line from (362, 37) to (485, 182) then Places a white dot at position (105, 210).
; PLAN: r0=362(x1), r1=37(y1), r2=485(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=210(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 37
LDI r2, 485
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 210
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
