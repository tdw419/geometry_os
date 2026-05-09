; DESCRIPTION: Places a green 106x48 rectangle at position (60, 74).
; PLAN: r0=60(x), r1=74(y), r2=106(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 74
LDI r2, 106
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
