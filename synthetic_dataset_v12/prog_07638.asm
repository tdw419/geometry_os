; DESCRIPTION: Places a cyan 48x106 rectangle at position (270, 34).
; PLAN: r0=270(x), r1=34(y), r2=48(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 34
LDI r2, 48
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
