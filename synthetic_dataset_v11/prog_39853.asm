; DESCRIPTION: Places a white 16x26 rectangle at position (186, 119).
; PLAN: r0=186(x), r1=119(y), r2=16(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 119
LDI r2, 16
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
