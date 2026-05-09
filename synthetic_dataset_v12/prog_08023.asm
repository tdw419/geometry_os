; DESCRIPTION: Places a red 56x27 rectangle at position (429, 54).
; PLAN: r0=429(x), r1=54(y), r2=56(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 54
LDI r2, 56
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
