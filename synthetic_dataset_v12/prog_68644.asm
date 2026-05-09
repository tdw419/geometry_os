; DESCRIPTION: Composite: Places a green dot at position (223, 124) then Places a yellow line segment connecting (209, 124) to (152, 136).
; PLAN: r0=223(x), r1=124(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=209(x1), r6=124(y1), r7=152(x2), r8=136(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 124
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 209
LDI r6, 124
LDI r7, 152
LDI r8, 136
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
