; DESCRIPTION: Places a cyan 53x82 box at position (189, 152).
; PLAN: r0=189(x), r1=152(y), r2=53(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 152
LDI r2, 53
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
