; DESCRIPTION: Places a purple 44x115 rectangle at position (102, 91).
; PLAN: r0=102(x), r1=91(y), r2=44(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 91
LDI r2, 44
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
