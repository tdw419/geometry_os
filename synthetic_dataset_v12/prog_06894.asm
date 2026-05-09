; DESCRIPTION: Places a blue 96x44 rectangle at position (305, 188).
; PLAN: r0=305(x), r1=188(y), r2=96(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 188
LDI r2, 96
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
