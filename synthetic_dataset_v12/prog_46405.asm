; DESCRIPTION: Places a cyan 107x110 rectangle at position (292, 3).
; PLAN: r0=292(x), r1=3(y), r2=107(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 3
LDI r2, 107
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
