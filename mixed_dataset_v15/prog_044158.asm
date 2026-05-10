; DESCRIPTION: Places a red circle of radius 42 at center (447, 135).
; PLAN: r0=447(x), r1=135(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 135
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
