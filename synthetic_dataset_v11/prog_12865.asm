; DESCRIPTION: Places a orange 68x120 rectangle at position (32, 135).
; PLAN: r0=32(x), r1=135(y), r2=68(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 135
LDI r2, 68
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
