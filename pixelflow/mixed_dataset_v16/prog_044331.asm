; DESCRIPTION: Places a orange 52x86 rectangle at position (350, 74).
; PLAN: r0=350(x), r1=74(y), r2=52(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 74
LDI r2, 52
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
