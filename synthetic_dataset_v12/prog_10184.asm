; DESCRIPTION: Places a red 112x54 rectangle at position (349, 54).
; PLAN: r0=349(x), r1=54(y), r2=112(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 54
LDI r2, 112
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
