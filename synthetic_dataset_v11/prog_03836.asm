; DESCRIPTION: Places a cyan circle of radius 52 at center (103, 171).
; PLAN: r0=103(x), r1=171(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 171
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
