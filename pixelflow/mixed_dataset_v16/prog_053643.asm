; DESCRIPTION: Composite: Draws a blue line from (5, 42) to (177, 224) then Sets a single white pixel at (404, 50).
; PLAN: r0=5(x1), r1=42(y1), r2=177(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=50(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 5
LDI r1, 42
LDI r2, 177
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 50
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
