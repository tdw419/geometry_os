; DESCRIPTION: Places a white 25x62 box at position (154, 91).
; PLAN: r0=154(x), r1=91(y), r2=25(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 91
LDI r2, 25
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
