; DESCRIPTION: Places a cyan circle of radius 16 at center (197, 219).
; PLAN: r0=197(x), r1=219(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 219
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
