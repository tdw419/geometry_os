; DESCRIPTION: Places a cyan 78x105 box at position (15, 38).
; PLAN: r0=15(x), r1=38(y), r2=78(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 38
LDI r2, 78
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
