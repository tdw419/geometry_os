; DESCRIPTION: Places a cyan circle of radius 20 at center (464, 126).
; PLAN: r0=464(x), r1=126(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 126
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
