; DESCRIPTION: Places a cyan circle of radius 57 at center (113, 92).
; PLAN: r0=113(x), r1=92(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 92
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
