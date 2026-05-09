; DESCRIPTION: Places a cyan 103x108 rectangle at position (153, 75).
; PLAN: r0=153(x), r1=75(y), r2=103(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 75
LDI r2, 103
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
