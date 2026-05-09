; DESCRIPTION: Composite: . Then Places a black 50x69 rectangle at position (138, 42). Then Places a orange line segment connecting (38, 170) to (87, 192).
; PLAN: r0=138(x), r1=42(y), r2=50(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=38(x1), r1=170(y1), r2=87(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 50x69 rectangle at position (138, 42).
; PLAN: r0=138(x), r1=42(y), r2=50(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 42
LDI r2, 50
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange line segment connecting (38, 170) to (87, 192).
; PLAN: r0=38(x1), r1=170(y1), r2=87(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 170
LDI r2, 87
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
