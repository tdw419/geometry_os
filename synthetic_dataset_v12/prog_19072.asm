; DESCRIPTION: Composite: Places a black dot at position (499, 186) then Places a yellow line segment connecting (465, 16) to (26, 60).
; PLAN: r0=499(x), r1=186(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=465(x1), r6=16(y1), r7=26(x2), r8=60(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 499
LDI r1, 186
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 465
LDI r6, 16
LDI r7, 26
LDI r8, 60
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
