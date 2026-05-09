; DESCRIPTION: Places a white 56x21 rectangle at position (295, 119).
; PLAN: r0=295(x), r1=119(y), r2=56(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 119
LDI r2, 56
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
