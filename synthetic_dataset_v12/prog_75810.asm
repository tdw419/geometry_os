; DESCRIPTION: Composite: Sets a single white pixel at (429, 22) then Places a black line segment connecting (202, 117) to (214, 193).
; PLAN: r0=429(x), r1=22(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=202(x1), r6=117(y1), r7=214(x2), r8=193(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 22
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 117
LDI r7, 214
LDI r8, 193
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
