; DESCRIPTION: Places a cyan 44x83 rectangle at position (35, 38).
; PLAN: r0=35(x), r1=38(y), r2=44(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 38
LDI r2, 44
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
