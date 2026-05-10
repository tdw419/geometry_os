; DESCRIPTION: Places a cyan 68x90 rectangle at position (58, 75).
; PLAN: r0=58(x), r1=75(y), r2=68(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 75
LDI r2, 68
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
