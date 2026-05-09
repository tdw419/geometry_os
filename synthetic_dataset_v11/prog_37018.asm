; DESCRIPTION: Places a orange 112x54 rectangle at position (98, 91).
; PLAN: r0=98(x), r1=91(y), r2=112(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 91
LDI r2, 112
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
