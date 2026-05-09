; DESCRIPTION: Places a white 104x46 rectangle at position (55, 159).
; PLAN: r0=55(x), r1=159(y), r2=104(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 159
LDI r2, 104
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
