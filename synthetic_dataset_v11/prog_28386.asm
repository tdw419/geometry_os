; DESCRIPTION: Places a black 50x76 rectangle at position (169, 54).
; PLAN: r0=169(x), r1=54(y), r2=50(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 54
LDI r2, 50
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
