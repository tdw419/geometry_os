; DESCRIPTION: Places a orange 61x35 rectangle at position (243, 148).
; PLAN: r0=243(x), r1=148(y), r2=61(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 148
LDI r2, 61
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
