; DESCRIPTION: Places a cyan 89x27 box at position (18, 70).
; PLAN: r0=18(x), r1=70(y), r2=89(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 70
LDI r2, 89
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
