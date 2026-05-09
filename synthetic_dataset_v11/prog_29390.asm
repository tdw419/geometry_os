; DESCRIPTION: Places a green 120x53 rectangle at position (106, 40).
; PLAN: r0=106(x), r1=40(y), r2=120(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 40
LDI r2, 120
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
