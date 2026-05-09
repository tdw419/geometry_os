; DESCRIPTION: Places a orange 120x102 rectangle at position (188, 109).
; PLAN: r0=188(x), r1=109(y), r2=120(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 109
LDI r2, 120
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
