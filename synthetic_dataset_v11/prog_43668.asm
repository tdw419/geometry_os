; DESCRIPTION: Places a cyan 22x70 rectangle at position (199, 131).
; PLAN: r0=199(x), r1=131(y), r2=22(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 131
LDI r2, 22
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
