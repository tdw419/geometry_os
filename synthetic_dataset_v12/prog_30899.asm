; DESCRIPTION: Places a orange 120x27 rectangle at position (290, 43).
; PLAN: r0=290(x), r1=43(y), r2=120(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 43
LDI r2, 120
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
