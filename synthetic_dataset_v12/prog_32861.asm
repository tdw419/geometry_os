; DESCRIPTION: Places a cyan 119x23 rectangle at position (158, 107).
; PLAN: r0=158(x), r1=107(y), r2=119(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 107
LDI r2, 119
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
