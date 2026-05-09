; DESCRIPTION: Places a green 13x109 rectangle at position (480, 109).
; PLAN: r0=480(x), r1=109(y), r2=13(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 109
LDI r2, 13
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
