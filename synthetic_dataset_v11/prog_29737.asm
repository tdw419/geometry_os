; DESCRIPTION: Places a yellow 117x98 rectangle at position (48, 73).
; PLAN: r0=48(x), r1=73(y), r2=117(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 73
LDI r2, 117
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
