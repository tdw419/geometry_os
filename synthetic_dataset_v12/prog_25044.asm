; DESCRIPTION: Places a cyan 59x20 rectangle at position (423, 195).
; PLAN: r0=423(x), r1=195(y), r2=59(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 195
LDI r2, 59
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
