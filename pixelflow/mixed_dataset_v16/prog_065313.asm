; DESCRIPTION: Places a purple 98x34 rectangle at position (75, 7).
; PLAN: r0=75(x), r1=7(y), r2=98(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 7
LDI r2, 98
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
