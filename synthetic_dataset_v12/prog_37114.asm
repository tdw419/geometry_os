; DESCRIPTION: Places a cyan 40x11 rectangle at position (423, 44).
; PLAN: r0=423(x), r1=44(y), r2=40(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 44
LDI r2, 40
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
