; DESCRIPTION: Places a orange 71x12 rectangle at position (228, 209).
; PLAN: r0=228(x), r1=209(y), r2=71(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 209
LDI r2, 71
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
