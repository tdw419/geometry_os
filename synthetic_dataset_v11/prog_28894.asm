; DESCRIPTION: Places a orange 82x16 rectangle at position (168, 132).
; PLAN: r0=168(x), r1=132(y), r2=82(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 132
LDI r2, 82
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
