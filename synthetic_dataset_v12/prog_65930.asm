; DESCRIPTION: Places a cyan circle of radius 17 at center (465, 126).
; PLAN: r0=465(x), r1=126(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 126
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
