; DESCRIPTION: Places a white 111x89 rectangle at position (241, 160).
; PLAN: r0=241(x), r1=160(y), r2=111(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 160
LDI r2, 111
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
