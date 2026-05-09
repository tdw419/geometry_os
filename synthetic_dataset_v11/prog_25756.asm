; DESCRIPTION: Places a cyan 89x72 rectangle at position (2, 167).
; PLAN: r0=2(x), r1=167(y), r2=89(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 167
LDI r2, 89
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
