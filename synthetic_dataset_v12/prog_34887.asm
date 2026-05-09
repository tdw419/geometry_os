; DESCRIPTION: Places a green 53x115 rectangle at position (243, 6).
; PLAN: r0=243(x), r1=6(y), r2=53(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 6
LDI r2, 53
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
