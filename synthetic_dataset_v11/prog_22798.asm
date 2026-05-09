; DESCRIPTION: Places a cyan circle of radius 16 at center (135, 97).
; PLAN: r0=135(x), r1=97(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 97
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
