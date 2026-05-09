; DESCRIPTION: Places a cyan circle of radius 32 at center (386, 202).
; PLAN: r0=386(x), r1=202(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 202
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
