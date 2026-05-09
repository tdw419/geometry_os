; DESCRIPTION: Places a green 70x81 rectangle at position (40, 134).
; PLAN: r0=40(x), r1=134(y), r2=70(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 134
LDI r2, 70
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
