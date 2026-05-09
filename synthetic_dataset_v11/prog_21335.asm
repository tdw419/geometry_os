; DESCRIPTION: Places a cyan 73x74 rectangle at position (129, 75).
; PLAN: r0=129(x), r1=75(y), r2=73(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 75
LDI r2, 73
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
