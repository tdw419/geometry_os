; DESCRIPTION: Places a green 71x42 rectangle at position (306, 191).
; PLAN: r0=306(x), r1=191(y), r2=71(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 191
LDI r2, 71
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
