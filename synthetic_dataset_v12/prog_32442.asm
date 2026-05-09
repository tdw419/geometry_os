; DESCRIPTION: Places a orange 16x73 rectangle at position (290, 125).
; PLAN: r0=290(x), r1=125(y), r2=16(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 125
LDI r2, 16
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
