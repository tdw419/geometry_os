; DESCRIPTION: Places a white 45x11 rectangle at position (290, 146).
; PLAN: r0=290(x), r1=146(y), r2=45(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 146
LDI r2, 45
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
