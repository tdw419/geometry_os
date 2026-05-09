; DESCRIPTION: Places a cyan 70x60 rectangle at position (165, 74).
; PLAN: r0=165(x), r1=74(y), r2=70(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 74
LDI r2, 70
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
