; DESCRIPTION: Places a white 45x38 box at position (352, 188).
; PLAN: r0=352(x), r1=188(y), r2=45(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 188
LDI r2, 45
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
