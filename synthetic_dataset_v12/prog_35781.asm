; DESCRIPTION: Places a cyan circle of radius 50 at center (433, 170).
; PLAN: r0=433(x), r1=170(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 170
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
