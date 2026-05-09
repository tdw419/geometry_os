; DESCRIPTION: Places a cyan 104x41 rectangle at position (113, 140).
; PLAN: r0=113(x), r1=140(y), r2=104(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 140
LDI r2, 104
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
