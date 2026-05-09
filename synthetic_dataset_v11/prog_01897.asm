; DESCRIPTION: Places a cyan 89x81 rectangle at position (44, 71).
; PLAN: r0=44(x), r1=71(y), r2=89(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 71
LDI r2, 89
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
