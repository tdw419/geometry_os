; DESCRIPTION: Places a green 40x66 rectangle at position (377, 121).
; PLAN: r0=377(x), r1=121(y), r2=40(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 121
LDI r2, 40
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
