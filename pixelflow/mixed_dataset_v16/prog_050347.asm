; DESCRIPTION: Places a orange 40x48 rectangle at position (371, 27).
; PLAN: r0=371(x), r1=27(y), r2=40(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 27
LDI r2, 40
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
