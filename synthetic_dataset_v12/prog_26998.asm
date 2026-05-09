; DESCRIPTION: Composite: Places a black dot at position (275, 140) then Draws a cyan line from (18, 70) to (287, 242).
; PLAN: r0=275(x), r1=140(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=18(x1), r6=70(y1), r7=287(x2), r8=242(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 140
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 18
LDI r6, 70
LDI r7, 287
LDI r8, 242
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
