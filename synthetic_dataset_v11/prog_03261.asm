; DESCRIPTION: Places a green 119x34 rectangle at position (79, 40).
; PLAN: r0=79(x), r1=40(y), r2=119(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 40
LDI r2, 119
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
