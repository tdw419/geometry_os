; DESCRIPTION: Places a cyan 23x90 rectangle at position (179, 153).
; PLAN: r0=179(x), r1=153(y), r2=23(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 153
LDI r2, 23
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
