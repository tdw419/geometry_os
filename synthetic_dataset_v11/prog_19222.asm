; DESCRIPTION: Places a purple 65x28 rectangle at position (74, 208).
; PLAN: r0=74(x), r1=208(y), r2=65(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 208
LDI r2, 65
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
