; DESCRIPTION: Places a orange 10x100 rectangle at position (392, 60).
; PLAN: r0=392(x), r1=60(y), r2=10(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 60
LDI r2, 10
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
