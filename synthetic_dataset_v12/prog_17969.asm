; DESCRIPTION: Places a cyan 112x16 rectangle at position (52, 149).
; PLAN: r0=52(x), r1=149(y), r2=112(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 149
LDI r2, 112
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
