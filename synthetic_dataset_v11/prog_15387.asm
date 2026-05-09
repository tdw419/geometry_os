; DESCRIPTION: Places a orange 47x52 rectangle at position (160, 193).
; PLAN: r0=160(x), r1=193(y), r2=47(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 193
LDI r2, 47
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
