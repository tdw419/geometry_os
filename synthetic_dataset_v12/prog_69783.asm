; DESCRIPTION: Places a cyan 106x90 rectangle at position (133, 35).
; PLAN: r0=133(x), r1=35(y), r2=106(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 35
LDI r2, 106
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
