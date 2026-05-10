; DESCRIPTION: Places a cyan disk with center (304, 166) and radius 46.
; PLAN: r0=304(x), r1=166(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 166
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
