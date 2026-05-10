; DESCRIPTION: Composite: Places a green dot at position (406, 223) then Places a black line segment connecting (382, 25) to (338, 65).
; PLAN: r0=406(x), r1=223(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=382(x1), r6=25(y1), r7=338(x2), r8=65(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 223
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 382
LDI r6, 25
LDI r7, 338
LDI r8, 65
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
