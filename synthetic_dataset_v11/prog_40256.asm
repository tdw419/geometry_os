; DESCRIPTION: Places a red circle of radius 16 at center (64, 228).
; PLAN: r0=64(x), r1=228(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 228
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
