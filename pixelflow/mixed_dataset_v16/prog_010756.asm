; DESCRIPTION: Places a red 62x70 rectangle at position (287, 150).
; PLAN: r0=287(x), r1=150(y), r2=62(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 150
LDI r2, 62
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
