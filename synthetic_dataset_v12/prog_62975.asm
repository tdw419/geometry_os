; DESCRIPTION: Places a purple 13x103 rectangle at position (226, 91).
; PLAN: r0=226(x), r1=91(y), r2=13(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 91
LDI r2, 13
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
