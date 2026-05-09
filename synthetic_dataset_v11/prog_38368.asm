; DESCRIPTION: Places a yellow 30x35 rectangle at position (73, 220).
; PLAN: r0=73(x), r1=220(y), r2=30(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 220
LDI r2, 30
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
