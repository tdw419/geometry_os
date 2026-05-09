; DESCRIPTION: Places a white 98x27 rectangle at position (123, 74).
; PLAN: r0=123(x), r1=74(y), r2=98(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 74
LDI r2, 98
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
