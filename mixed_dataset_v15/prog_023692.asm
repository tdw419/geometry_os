; DESCRIPTION: Composite: Draws a magenta line from (299, 201) to (330, 72) then Places a white circle of radius 35 at center (215, 47).
; PLAN: r0=299(x1), r1=201(y1), r2=330(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=47(y), r7=35(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 299
LDI r1, 201
LDI r2, 330
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 47
LDI r7, 35
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
