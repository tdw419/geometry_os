; DESCRIPTION: Places a orange 81x24 rectangle at position (180, 197).
; PLAN: r0=180(x), r1=197(y), r2=81(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 197
LDI r2, 81
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
