; DESCRIPTION: Places a green 45x38 rectangle at position (251, 209).
; PLAN: r0=251(x), r1=209(y), r2=45(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 209
LDI r2, 45
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
