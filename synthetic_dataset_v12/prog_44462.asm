; DESCRIPTION: Places a green 18x70 rectangle at position (140, 16).
; PLAN: r0=140(x), r1=16(y), r2=18(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 16
LDI r2, 18
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
