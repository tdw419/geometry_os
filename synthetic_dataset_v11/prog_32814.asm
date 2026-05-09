; DESCRIPTION: Places a orange 27x31 rectangle at position (228, 40).
; PLAN: r0=228(x), r1=40(y), r2=27(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 40
LDI r2, 27
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
