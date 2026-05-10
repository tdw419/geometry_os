; DESCRIPTION: Composite: Places a black dot at position (71, 237) then Draws a white line from (428, 109) to (401, 33).
; PLAN: r0=71(x), r1=237(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=428(x1), r6=109(y1), r7=401(x2), r8=33(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 237
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 428
LDI r6, 109
LDI r7, 401
LDI r8, 33
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
