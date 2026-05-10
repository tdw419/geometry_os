; DESCRIPTION: Places a cyan 47x76 box at position (199, 79).
; PLAN: r0=199(x), r1=79(y), r2=47(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 79
LDI r2, 47
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
