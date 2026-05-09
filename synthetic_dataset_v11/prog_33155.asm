; DESCRIPTION: Places a red 13x80 rectangle at position (130, 150).
; PLAN: r0=130(x), r1=150(y), r2=13(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 150
LDI r2, 13
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
