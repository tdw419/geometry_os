; DESCRIPTION: Places a red 34x54 rectangle at position (204, 93).
; PLAN: r0=204(x), r1=93(y), r2=34(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 93
LDI r2, 34
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
