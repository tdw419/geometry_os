; DESCRIPTION: Places a red 40x90 rectangle at position (123, 150).
; PLAN: r0=123(x), r1=150(y), r2=40(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 150
LDI r2, 40
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
