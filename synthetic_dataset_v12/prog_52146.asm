; DESCRIPTION: Places a red 95x25 rectangle at position (244, 17).
; PLAN: r0=244(x), r1=17(y), r2=95(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 17
LDI r2, 95
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
