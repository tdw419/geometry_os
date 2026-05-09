; DESCRIPTION: Places a green 29x94 rectangle at position (79, 59).
; PLAN: r0=79(x), r1=59(y), r2=29(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 59
LDI r2, 29
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
