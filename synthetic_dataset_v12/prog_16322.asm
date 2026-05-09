; DESCRIPTION: Places a cyan 74x91 rectangle at position (152, 122).
; PLAN: r0=152(x), r1=122(y), r2=74(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 122
LDI r2, 74
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
