; DESCRIPTION: Creates a red circular shape at (156, 197) with radius 50.
; PLAN: r0=156(x), r1=197(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 197
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
