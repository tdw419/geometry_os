; DESCRIPTION: Places a purple 48x81 rectangle at position (46, 71).
; PLAN: r0=46(x), r1=71(y), r2=48(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 71
LDI r2, 48
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
