; DESCRIPTION: Places a cyan 110x56 rectangle at position (48, 63).
; PLAN: r0=48(x), r1=63(y), r2=110(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 63
LDI r2, 110
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
