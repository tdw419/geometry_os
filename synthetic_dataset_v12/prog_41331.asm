; DESCRIPTION: Places a red 72x54 rectangle at position (296, 127).
; PLAN: r0=296(x), r1=127(y), r2=72(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 127
LDI r2, 72
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
