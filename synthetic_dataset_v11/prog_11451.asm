; DESCRIPTION: Places a cyan 100x26 rectangle at position (112, 200).
; PLAN: r0=112(x), r1=200(y), r2=100(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 200
LDI r2, 100
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
