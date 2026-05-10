; DESCRIPTION: Places a cyan 36x34 box at position (100, 184).
; PLAN: r0=100(x), r1=184(y), r2=36(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 184
LDI r2, 36
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
