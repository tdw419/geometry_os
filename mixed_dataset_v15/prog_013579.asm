; DESCRIPTION: Places a red 35x98 rectangle at position (296, 10).
; PLAN: r0=296(x), r1=10(y), r2=35(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 10
LDI r2, 35
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
