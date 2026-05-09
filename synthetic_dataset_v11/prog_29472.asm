; DESCRIPTION: Places a purple 57x52 rectangle at position (125, 186).
; PLAN: r0=125(x), r1=186(y), r2=57(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 186
LDI r2, 57
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
