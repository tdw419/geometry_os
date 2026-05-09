; DESCRIPTION: Places a cyan circle of radius 58 at center (133, 117).
; PLAN: r0=133(x), r1=117(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 117
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
