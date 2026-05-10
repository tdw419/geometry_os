; DESCRIPTION: Composite: Places a yellow dot at position (329, 47) then Places a white line segment connecting (271, 144) to (469, 236).
; PLAN: r0=329(x), r1=47(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=271(x1), r6=144(y1), r7=469(x2), r8=236(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 47
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 271
LDI r6, 144
LDI r7, 469
LDI r8, 236
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
