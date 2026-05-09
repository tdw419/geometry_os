; DESCRIPTION: Places a green 109x25 rectangle at position (48, 58).
; PLAN: r0=48(x), r1=58(y), r2=109(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 58
LDI r2, 109
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
