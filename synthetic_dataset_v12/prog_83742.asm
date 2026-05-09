; DESCRIPTION: Places a green 13x23 rectangle at position (182, 54).
; PLAN: r0=182(x), r1=54(y), r2=13(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 54
LDI r2, 13
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
