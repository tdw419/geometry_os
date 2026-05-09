; DESCRIPTION: Composite: Renders a red disk with center (72, 64) and radius 43 then Draws a black line from (487, 47) to (103, 239).
; PLAN: r0=72(x), r1=64(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x1), r6=47(y1), r7=103(x2), r8=239(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 64
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 47
LDI r7, 103
LDI r8, 239
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
