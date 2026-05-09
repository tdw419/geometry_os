; DESCRIPTION: Places a cyan 113x81 rectangle at position (353, 85).
; PLAN: r0=353(x), r1=85(y), r2=113(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 85
LDI r2, 113
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
