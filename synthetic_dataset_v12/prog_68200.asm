; DESCRIPTION: Places a cyan 105x103 rectangle at position (186, 74).
; PLAN: r0=186(x), r1=74(y), r2=105(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 74
LDI r2, 105
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
