; DESCRIPTION: Composite: Places a white dot at position (153, 131) then Places a blue line segment connecting (152, 29) to (332, 113).
; PLAN: r0=153(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=152(x1), r6=29(y1), r7=332(x2), r8=113(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 131
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 152
LDI r6, 29
LDI r7, 332
LDI r8, 113
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
