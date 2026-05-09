; DESCRIPTION: Places a orange 103x12 rectangle at position (290, 215).
; PLAN: r0=290(x), r1=215(y), r2=103(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 215
LDI r2, 103
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
