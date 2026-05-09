; DESCRIPTION: Places a red 40x54 rectangle at position (349, 130).
; PLAN: r0=349(x), r1=130(y), r2=40(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 130
LDI r2, 40
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
