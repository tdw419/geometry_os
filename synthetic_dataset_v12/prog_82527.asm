; DESCRIPTION: Places a red 104x31 rectangle at position (46, 87).
; PLAN: r0=46(x), r1=87(y), r2=104(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 87
LDI r2, 104
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
