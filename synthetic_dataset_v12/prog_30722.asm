; DESCRIPTION: Places a green 70x21 rectangle at position (253, 17).
; PLAN: r0=253(x), r1=17(y), r2=70(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 17
LDI r2, 70
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
