; DESCRIPTION: Places a green 10x87 rectangle at position (203, 104).
; PLAN: r0=203(x), r1=104(y), r2=10(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 104
LDI r2, 10
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
