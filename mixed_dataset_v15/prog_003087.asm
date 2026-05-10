; DESCRIPTION: Places a white 36x19 rectangle at position (290, 160).
; PLAN: r0=290(x), r1=160(y), r2=36(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 160
LDI r2, 36
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
