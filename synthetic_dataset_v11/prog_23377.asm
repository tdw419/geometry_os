; DESCRIPTION: Places a purple 24x25 rectangle at position (211, 229).
; PLAN: r0=211(x), r1=229(y), r2=24(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 229
LDI r2, 24
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
