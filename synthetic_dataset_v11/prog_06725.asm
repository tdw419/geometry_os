; DESCRIPTION: Composite: . Then Places a red 61x89 rectangle at position (128, 129). Then Sets a single white pixel at (95, 200).
; PLAN: r0=128(x), r1=129(y), r2=61(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=95(x), r1=200(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red 61x89 rectangle at position (128, 129).
; PLAN: r0=128(x), r1=129(y), r2=61(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 129
LDI r2, 61
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (95, 200).
; PLAN: r0=95(x), r1=200(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 200
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
