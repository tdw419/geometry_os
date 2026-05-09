; DESCRIPTION: Composite: Places a black circle of radius 80 at center (379, 111) then Draws a green line from (100, 98) to (500, 242).
; PLAN: r0=379(x), r1=111(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x1), r6=98(y1), r7=500(x2), r8=242(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 111
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 98
LDI r7, 500
LDI r8, 242
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
