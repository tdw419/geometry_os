; DESCRIPTION: Composite: Draws a black line from (202, 27) to (60, 19) then Sets a single green pixel at (42, 239).
; PLAN: r0=202(x1), r1=27(y1), r2=60(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=239(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 202
LDI r1, 27
LDI r2, 60
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 239
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
