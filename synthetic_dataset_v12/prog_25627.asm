; DESCRIPTION: Places a cyan 80x105 rectangle at position (176, 72).
; PLAN: r0=176(x), r1=72(y), r2=80(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 72
LDI r2, 80
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
