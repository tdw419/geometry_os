; DESCRIPTION: Places a green 87x109 rectangle at position (17, 54).
; PLAN: r0=17(x), r1=54(y), r2=87(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 54
LDI r2, 87
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
