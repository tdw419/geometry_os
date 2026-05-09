; DESCRIPTION: Composite: Renders a white line between points (272, 95) and (32, 214) then Sets a single white pixel at (367, 64).
; PLAN: r0=272(x1), r1=95(y1), r2=32(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=64(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 95
LDI r2, 32
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 64
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
