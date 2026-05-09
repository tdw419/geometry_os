; DESCRIPTION: Places a cyan 71x57 rectangle at position (185, 162).
; PLAN: r0=185(x), r1=162(y), r2=71(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 162
LDI r2, 71
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
