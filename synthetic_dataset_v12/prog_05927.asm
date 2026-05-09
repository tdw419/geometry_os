; DESCRIPTION: Places a cyan 51x61 rectangle at position (251, 130).
; PLAN: r0=251(x), r1=130(y), r2=51(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 130
LDI r2, 51
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
