; DESCRIPTION: Places a red 60x80 rectangle at position (296, 12).
; PLAN: r0=296(x), r1=12(y), r2=60(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 12
LDI r2, 60
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
