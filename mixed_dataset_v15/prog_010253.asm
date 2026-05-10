; DESCRIPTION: Places a cyan 47x41 rectangle at position (152, 63).
; PLAN: r0=152(x), r1=63(y), r2=47(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 63
LDI r2, 47
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
