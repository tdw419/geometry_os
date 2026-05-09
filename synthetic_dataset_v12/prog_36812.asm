; DESCRIPTION: Places a cyan 80x22 rectangle at position (125, 80).
; PLAN: r0=125(x), r1=80(y), r2=80(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 80
LDI r2, 80
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
