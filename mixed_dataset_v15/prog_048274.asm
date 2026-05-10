; DESCRIPTION: Places a white 65x15 rectangle at position (206, 236).
; PLAN: r0=206(x), r1=236(y), r2=65(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 236
LDI r2, 65
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
