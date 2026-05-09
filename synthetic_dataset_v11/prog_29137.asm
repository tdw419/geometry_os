; DESCRIPTION: Places a purple 54x45 rectangle at position (186, 6).
; PLAN: r0=186(x), r1=6(y), r2=54(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 6
LDI r2, 54
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
