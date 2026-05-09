; DESCRIPTION: Places a cyan 107x36 rectangle at position (2, 114).
; PLAN: r0=2(x), r1=114(y), r2=107(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 114
LDI r2, 107
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
