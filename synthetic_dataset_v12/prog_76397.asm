; DESCRIPTION: Places a cyan 117x24 rectangle at position (138, 188).
; PLAN: r0=138(x), r1=188(y), r2=117(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 188
LDI r2, 117
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
