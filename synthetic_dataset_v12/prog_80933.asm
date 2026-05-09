; DESCRIPTION: Places a green 26x104 rectangle at position (309, 14).
; PLAN: r0=309(x), r1=14(y), r2=26(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 14
LDI r2, 26
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
