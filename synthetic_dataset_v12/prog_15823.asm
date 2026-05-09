; DESCRIPTION: Places a green 85x33 rectangle at position (186, 126).
; PLAN: r0=186(x), r1=126(y), r2=85(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 126
LDI r2, 85
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
