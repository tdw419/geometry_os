; DESCRIPTION: Composite: Places a yellow line segment connecting (202, 132) to (302, 154) then Sets a single white pixel at (393, 215).
; PLAN: r0=202(x1), r1=132(y1), r2=302(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=215(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 202
LDI r1, 132
LDI r2, 302
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 215
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
