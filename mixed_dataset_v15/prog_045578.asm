; DESCRIPTION: Composite: Places a black dot at position (280, 210) then Places a red line segment connecting (446, 147) to (302, 197).
; PLAN: r0=280(x), r1=210(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=446(x1), r6=147(y1), r7=302(x2), r8=197(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 210
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 446
LDI r6, 147
LDI r7, 302
LDI r8, 197
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
