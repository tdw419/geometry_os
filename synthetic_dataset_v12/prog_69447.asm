; DESCRIPTION: Places a purple 35x109 rectangle at position (290, 82).
; PLAN: r0=290(x), r1=82(y), r2=35(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 82
LDI r2, 35
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
