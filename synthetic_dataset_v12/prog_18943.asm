; DESCRIPTION: Places a cyan circle of radius 16 at center (340, 108).
; PLAN: r0=340(x), r1=108(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 108
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
