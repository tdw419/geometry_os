; DESCRIPTION: Places a cyan circle of radius 50 at center (80, 206).
; PLAN: r0=80(x), r1=206(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 206
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
