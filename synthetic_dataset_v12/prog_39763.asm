; DESCRIPTION: Composite: Places a yellow dot at position (269, 46) then Draws a white line from (117, 102) to (29, 244).
; PLAN: r0=269(x), r1=46(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=117(x1), r6=102(y1), r7=29(x2), r8=244(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 46
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 117
LDI r6, 102
LDI r7, 29
LDI r8, 244
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
