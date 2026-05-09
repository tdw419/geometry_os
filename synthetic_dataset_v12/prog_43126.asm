; DESCRIPTION: Places a white 104x45 rectangle at position (309, 21).
; PLAN: r0=309(x), r1=21(y), r2=104(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 21
LDI r2, 104
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
