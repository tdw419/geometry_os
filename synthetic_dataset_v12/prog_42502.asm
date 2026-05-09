; DESCRIPTION: Places a red 40x65 rectangle at position (109, 50).
; PLAN: r0=109(x), r1=50(y), r2=40(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 50
LDI r2, 40
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
