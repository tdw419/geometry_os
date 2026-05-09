; DESCRIPTION: Places a yellow 25x115 rectangle at position (161, 65).
; PLAN: r0=161(x), r1=65(y), r2=25(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 65
LDI r2, 25
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
