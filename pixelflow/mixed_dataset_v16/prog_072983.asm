; DESCRIPTION: Places a orange 54x103 rectangle at position (277, 71).
; PLAN: r0=277(x), r1=71(y), r2=54(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 71
LDI r2, 54
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
