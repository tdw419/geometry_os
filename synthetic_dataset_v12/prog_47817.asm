; DESCRIPTION: Places a purple 71x74 rectangle at position (66, 134).
; PLAN: r0=66(x), r1=134(y), r2=71(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 134
LDI r2, 71
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
