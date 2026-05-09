; DESCRIPTION: Places a red 14x54 rectangle at position (301, 163).
; PLAN: r0=301(x), r1=163(y), r2=14(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 163
LDI r2, 14
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
