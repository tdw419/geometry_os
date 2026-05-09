; DESCRIPTION: Places a cyan 11x80 rectangle at position (432, 3).
; PLAN: r0=432(x), r1=3(y), r2=11(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 3
LDI r2, 11
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
