; DESCRIPTION: Places a cyan circle of radius 42 at center (349, 61).
; PLAN: r0=349(x), r1=61(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 61
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
