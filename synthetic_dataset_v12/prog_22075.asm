; DESCRIPTION: Places a green 120x35 rectangle at position (125, 64).
; PLAN: r0=125(x), r1=64(y), r2=120(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 64
LDI r2, 120
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
