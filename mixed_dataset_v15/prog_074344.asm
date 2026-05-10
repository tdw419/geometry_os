; DESCRIPTION: Composite: Creates a blue circular shape at (147, 161) with radius 76 then Draws a magenta line from (445, 154) to (214, 51).
; PLAN: r0=147(x), r1=161(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=445(x1), r6=154(y1), r7=214(x2), r8=51(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 161
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 445
LDI r6, 154
LDI r7, 214
LDI r8, 51
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
