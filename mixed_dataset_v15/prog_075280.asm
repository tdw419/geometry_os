; DESCRIPTION: Places a purple 77x47 rectangle at position (215, 199).
; PLAN: r0=215(x), r1=199(y), r2=77(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 199
LDI r2, 77
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
