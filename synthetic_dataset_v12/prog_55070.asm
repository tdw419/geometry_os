; DESCRIPTION: Places a cyan 31x119 rectangle at position (174, 131).
; PLAN: r0=174(x), r1=131(y), r2=31(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 131
LDI r2, 31
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
