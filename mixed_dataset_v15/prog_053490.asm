; DESCRIPTION: Places a orange 50x86 rectangle at position (325, 57).
; PLAN: r0=325(x), r1=57(y), r2=50(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 57
LDI r2, 50
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
