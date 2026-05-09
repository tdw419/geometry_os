; DESCRIPTION: Places a cyan circle of radius 73 at center (408, 174).
; PLAN: r0=408(x), r1=174(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 174
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
