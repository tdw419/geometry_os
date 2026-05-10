; DESCRIPTION: Places a orange 36x91 rectangle at position (103, 36).
; PLAN: r0=103(x), r1=36(y), r2=36(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 36
LDI r2, 36
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
