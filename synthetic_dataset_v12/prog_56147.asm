; DESCRIPTION: Places a green 34x52 rectangle at position (325, 98).
; PLAN: r0=325(x), r1=98(y), r2=34(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 98
LDI r2, 34
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
