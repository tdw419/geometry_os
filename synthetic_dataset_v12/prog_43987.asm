; DESCRIPTION: Places a red 55x85 rectangle at position (333, 160).
; PLAN: r0=333(x), r1=160(y), r2=55(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 160
LDI r2, 55
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
