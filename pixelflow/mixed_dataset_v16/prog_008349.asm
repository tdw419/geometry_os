; DESCRIPTION: Places a red 60x117 box at position (173, 161).
; PLAN: r0=173(x), r1=161(y), r2=60(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 161
LDI r2, 60
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
