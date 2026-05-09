; DESCRIPTION: Places a purple 96x91 rectangle at position (157, 96).
; PLAN: r0=157(x), r1=96(y), r2=96(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 96
LDI r2, 96
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
