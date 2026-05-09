; DESCRIPTION: Places a green 25x120 rectangle at position (91, 10).
; PLAN: r0=91(x), r1=10(y), r2=25(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 10
LDI r2, 25
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
