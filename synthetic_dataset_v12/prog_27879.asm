; DESCRIPTION: Places a yellow 70x73 rectangle at position (27, 110).
; PLAN: r0=27(x), r1=110(y), r2=70(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 110
LDI r2, 70
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
