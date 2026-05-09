; DESCRIPTION: Places a cyan 98x115 rectangle at position (219, 19).
; PLAN: r0=219(x), r1=19(y), r2=98(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 19
LDI r2, 98
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
