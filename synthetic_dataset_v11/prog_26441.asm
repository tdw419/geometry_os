; DESCRIPTION: Places a cyan 95x40 rectangle at position (119, 175).
; PLAN: r0=119(x), r1=175(y), r2=95(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 175
LDI r2, 95
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
