; DESCRIPTION: Places a cyan 10x57 rectangle at position (241, 199).
; PLAN: r0=241(x), r1=199(y), r2=10(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 199
LDI r2, 10
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
