; DESCRIPTION: Places a white 23x82 rectangle at position (418, 46).
; PLAN: r0=418(x), r1=46(y), r2=23(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 46
LDI r2, 23
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
