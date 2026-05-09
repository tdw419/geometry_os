; DESCRIPTION: Places a green 24x34 rectangle at position (196, 216).
; PLAN: r0=196(x), r1=216(y), r2=24(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 216
LDI r2, 24
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
