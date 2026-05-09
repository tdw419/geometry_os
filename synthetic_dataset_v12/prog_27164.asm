; DESCRIPTION: Places a purple 52x50 rectangle at position (65, 106).
; PLAN: r0=65(x), r1=106(y), r2=52(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 106
LDI r2, 52
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
