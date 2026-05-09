; DESCRIPTION: Places a orange 87x90 rectangle at position (60, 120).
; PLAN: r0=60(x), r1=120(y), r2=87(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 120
LDI r2, 87
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
