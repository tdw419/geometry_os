; DESCRIPTION: Places a orange 33x81 rectangle at position (146, 12).
; PLAN: r0=146(x), r1=12(y), r2=33(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 12
LDI r2, 33
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
