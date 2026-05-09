; DESCRIPTION: Places a cyan 50x97 rectangle at position (66, 51).
; PLAN: r0=66(x), r1=51(y), r2=50(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 51
LDI r2, 50
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
