; DESCRIPTION: Places a red 91x62 rectangle at position (70, 17).
; PLAN: r0=70(x), r1=17(y), r2=91(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 17
LDI r2, 91
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
