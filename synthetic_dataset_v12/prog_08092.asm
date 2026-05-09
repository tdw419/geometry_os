; DESCRIPTION: Places a orange 21x70 rectangle at position (228, 165).
; PLAN: r0=228(x), r1=165(y), r2=21(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 165
LDI r2, 21
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
