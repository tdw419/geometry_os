; DESCRIPTION: Places a purple 57x110 rectangle at position (295, 146).
; PLAN: r0=295(x), r1=146(y), r2=57(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 146
LDI r2, 57
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
