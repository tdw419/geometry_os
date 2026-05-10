; DESCRIPTION: Places a green 73x76 rectangle at position (158, 46).
; PLAN: r0=158(x), r1=46(y), r2=73(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 46
LDI r2, 73
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
