; DESCRIPTION: Places a cyan 35x56 rectangle at position (474, 66).
; PLAN: r0=474(x), r1=66(y), r2=35(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 66
LDI r2, 35
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
