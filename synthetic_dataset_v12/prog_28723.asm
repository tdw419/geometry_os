; DESCRIPTION: Places a yellow 91x93 rectangle at position (2, 161).
; PLAN: r0=2(x), r1=161(y), r2=91(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 161
LDI r2, 91
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
