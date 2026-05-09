; DESCRIPTION: Places a green 107x74 rectangle at position (117, 107).
; PLAN: r0=117(x), r1=107(y), r2=107(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 107
LDI r2, 107
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
