; DESCRIPTION: Places a orange 25x56 rectangle at position (320, 47).
; PLAN: r0=320(x), r1=47(y), r2=25(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 47
LDI r2, 25
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
