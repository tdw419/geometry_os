; DESCRIPTION: Places a purple 117x38 rectangle at position (77, 68).
; PLAN: r0=77(x), r1=68(y), r2=117(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 68
LDI r2, 117
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
