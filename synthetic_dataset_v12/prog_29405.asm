; DESCRIPTION: Places a purple 71x16 rectangle at position (361, 209).
; PLAN: r0=361(x), r1=209(y), r2=71(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 209
LDI r2, 71
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
