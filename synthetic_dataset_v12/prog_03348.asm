; DESCRIPTION: Places a cyan 115x105 rectangle at position (199, 135).
; PLAN: r0=199(x), r1=135(y), r2=115(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 135
LDI r2, 115
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
