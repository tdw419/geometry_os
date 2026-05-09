; DESCRIPTION: Places a cyan 57x96 rectangle at position (172, 33).
; PLAN: r0=172(x), r1=33(y), r2=57(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 33
LDI r2, 57
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
