; DESCRIPTION: Places a white 65x34 rectangle at position (7, 152).
; PLAN: r0=7(x), r1=152(y), r2=65(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 152
LDI r2, 65
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
