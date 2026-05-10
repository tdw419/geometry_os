; DESCRIPTION: Places a yellow 73x34 rectangle at position (100, 180).
; PLAN: r0=100(x), r1=180(y), r2=73(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 180
LDI r2, 73
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
