; DESCRIPTION: Places a cyan 90x79 rectangle at position (0, 136).
; PLAN: r0=0(x), r1=136(y), r2=90(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 136
LDI r2, 90
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
