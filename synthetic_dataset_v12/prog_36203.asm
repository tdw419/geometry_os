; DESCRIPTION: Places a cyan circle of radius 50 at center (393, 108).
; PLAN: r0=393(x), r1=108(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 108
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
