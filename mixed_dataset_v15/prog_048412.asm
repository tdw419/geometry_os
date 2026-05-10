; DESCRIPTION: Composite: Draws a green line from (225, 177) to (382, 42) then Sets a single white pixel at (328, 126).
; PLAN: r0=225(x1), r1=177(y1), r2=382(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=126(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 225
LDI r1, 177
LDI r2, 382
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 126
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
