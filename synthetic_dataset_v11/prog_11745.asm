; DESCRIPTION: Places a cyan circle of radius 51 at center (113, 97).
; PLAN: r0=113(x), r1=97(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 97
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
