; DESCRIPTION: Places a black 50x109 rectangle at position (91, 30).
; PLAN: r0=91(x), r1=30(y), r2=50(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 30
LDI r2, 50
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
