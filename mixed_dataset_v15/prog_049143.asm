; DESCRIPTION: Places a red 98x10 rectangle at position (68, 54).
; PLAN: r0=68(x), r1=54(y), r2=98(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 54
LDI r2, 98
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
