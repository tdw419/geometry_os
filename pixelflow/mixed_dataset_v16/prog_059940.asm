; DESCRIPTION: Composite: Places a black dot at position (382, 208) then Draws a white line from (501, 22) to (152, 218).
; PLAN: r0=382(x), r1=208(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=501(x1), r6=22(y1), r7=152(x2), r8=218(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 208
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 501
LDI r6, 22
LDI r7, 152
LDI r8, 218
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
