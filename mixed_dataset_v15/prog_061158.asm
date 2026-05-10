; DESCRIPTION: Places a blue 30x68 rectangle at position (433, 21).
; PLAN: r0=433(x), r1=21(y), r2=30(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 21
LDI r2, 30
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
