; DESCRIPTION: Places a cyan 51x97 rectangle at position (57, 49).
; PLAN: r0=57(x), r1=49(y), r2=51(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 49
LDI r2, 51
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
