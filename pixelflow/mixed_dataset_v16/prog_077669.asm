; DESCRIPTION: Places a cyan 107x84 rectangle at position (361, 153).
; PLAN: r0=361(x), r1=153(y), r2=107(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 153
LDI r2, 107
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
