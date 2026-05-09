; DESCRIPTION: Places a purple 42x25 rectangle at position (223, 44).
; PLAN: r0=223(x), r1=44(y), r2=42(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 44
LDI r2, 42
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
