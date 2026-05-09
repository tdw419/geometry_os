; DESCRIPTION: Places a cyan 20x35 rectangle at position (170, 39).
; PLAN: r0=170(x), r1=39(y), r2=20(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 39
LDI r2, 20
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
