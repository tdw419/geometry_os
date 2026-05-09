; DESCRIPTION: Places a green 20x55 rectangle at position (208, 38).
; PLAN: r0=208(x), r1=38(y), r2=20(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 38
LDI r2, 20
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
