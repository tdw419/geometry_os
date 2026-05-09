; DESCRIPTION: Places a green 92x110 rectangle at position (41, 132).
; PLAN: r0=41(x), r1=132(y), r2=92(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 132
LDI r2, 92
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
