; DESCRIPTION: Places a red 80x79 rectangle at position (189, 150).
; PLAN: r0=189(x), r1=150(y), r2=80(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 150
LDI r2, 80
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
