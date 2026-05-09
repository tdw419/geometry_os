; DESCRIPTION: Composite: Places a white dot at position (14, 132) then Places a magenta line segment connecting (142, 121) to (328, 78).
; PLAN: r0=14(x), r1=132(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=142(x1), r6=121(y1), r7=328(x2), r8=78(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 14
LDI r1, 132
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 142
LDI r6, 121
LDI r7, 328
LDI r8, 78
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
