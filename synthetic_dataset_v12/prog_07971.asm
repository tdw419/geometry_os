; DESCRIPTION: Places a cyan 77x107 rectangle at position (170, 106).
; PLAN: r0=170(x), r1=106(y), r2=77(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 106
LDI r2, 77
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
