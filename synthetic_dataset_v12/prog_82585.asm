; DESCRIPTION: Places a cyan 34x98 rectangle at position (233, 110).
; PLAN: r0=233(x), r1=110(y), r2=34(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 110
LDI r2, 34
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
