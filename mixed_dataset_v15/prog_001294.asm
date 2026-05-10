; DESCRIPTION: Places a cyan 75x22 rectangle at position (299, 51).
; PLAN: r0=299(x), r1=51(y), r2=75(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 51
LDI r2, 75
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
