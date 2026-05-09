; DESCRIPTION: Places a cyan 29x117 rectangle at position (196, 44).
; PLAN: r0=196(x), r1=44(y), r2=29(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 44
LDI r2, 29
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
