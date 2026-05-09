; DESCRIPTION: Places a purple 91x118 rectangle at position (186, 55).
; PLAN: r0=186(x), r1=55(y), r2=91(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 55
LDI r2, 91
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
