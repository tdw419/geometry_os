; DESCRIPTION: Places a cyan 89x44 rectangle at position (39, 60).
; PLAN: r0=39(x), r1=60(y), r2=89(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 60
LDI r2, 89
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
