; DESCRIPTION: Composite: . Then Places a red line segment connecting (236, 173) to (241, 87). Then Sets a single white pixel at (81, 244).
; PLAN: r0=236(x1), r1=173(y1), r2=241(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=81(x), r1=244(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (236, 173) to (241, 87).
; PLAN: r0=236(x1), r1=173(y1), r2=241(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 173
LDI r2, 241
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (81, 244).
; PLAN: r0=81(x), r1=244(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 244
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
