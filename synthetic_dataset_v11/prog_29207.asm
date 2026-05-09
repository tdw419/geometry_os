; DESCRIPTION: Places a cyan circle of radius 63 at center (79, 133).
; PLAN: r0=79(x), r1=133(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 133
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
