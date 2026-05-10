; DESCRIPTION: Composite: Places a magenta line segment connecting (42, 143) to (95, 162) then Sets a single yellow pixel at (214, 190).
; PLAN: r0=42(x1), r1=143(y1), r2=95(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=190(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 42
LDI r1, 143
LDI r2, 95
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 190
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
