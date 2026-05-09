; DESCRIPTION: Places a cyan 65x47 rectangle at position (428, 58).
; PLAN: r0=428(x), r1=58(y), r2=65(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 58
LDI r2, 65
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
