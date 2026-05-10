; DESCRIPTION: Places a orange 13x100 rectangle at position (320, 83).
; PLAN: r0=320(x), r1=83(y), r2=13(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 83
LDI r2, 13
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
